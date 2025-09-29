import Testing
import Foundation
@testable import InvestmentCore

@Test func oneItem() {
    //Arrange
    let sut: FetchAvailableItemsToInvestUseCaseInput = FetchAvailableItemsToInvestUseCase(itemRepository: MockItemRepository(), output: MockOutPut())
    //Act
    try! sut.execute()
    
    //Assert
    #expect(sut.items.count == 1)
}

@Test func multipleItems() {
    let sut: FetchAvailableItemsToInvestUseCaseInput = FetchAvailableItemsToInvestUseCase(itemRepository: MockItemRepository(itemsToReturn: [
        Item.mockItemWithInvestment,
        Item.mockItemWithInvestment,
        Item.mockItemWithInvestment
    ]), output: MockOutPut())
    try! sut.execute()
    #expect(sut.items.count == 3)
}

@Test func returnedItemIsValid() {
    let sut = FetchAvailableItemsToInvestUseCase(itemRepository: MockItemRepository(), output: MockOutPut())
    try! sut.execute()
    let item = sut.items.first!
    assertValid(item)
}

@Test func itemWithoutInvestment() {
    let sut = FetchAvailableItemsToInvestUseCase(itemRepository: MockItemRepository(itemsToReturn: [
        Item.mockItemWithOutInvestment
    ]), output: MockOutPut())
    try! sut.execute()
    let item = sut.items.first!
    #expect(item.investment == nil)
}


@Test func investmentHasValidData() {
    let sut = FetchAvailableItemsToInvestUseCase(itemRepository: MockItemRepository(), output: MockOutPut())
    try! sut.execute()
    let item = sut.items.first!
    #expect(item.investment!.minimumInvestmentAmount > 0)
}

@Test func verifyCallBackWhenOneItemAddedAndItemsCount() {
    let output = MockOutPut()
    let sut = FetchAvailableItemsToInvestUseCase(itemRepository: MockItemRepository(itemsToReturn: [
        Item.mockItemWithInvestment,
        Item.mockItemWithInvestment,
        Item.mockItemWithInvestment,
    ]), output: output)
    
    try! sut.execute()
    
    #expect(output.didFetchItemsCalled == true)
    #expect(output.receivedItems.count == 3)
}


@Test func verifyCallBackWhenMultipleItemsAddedAndItemsCount() {
    let output = MockOutPut()
    let sut = FetchAvailableItemsToInvestUseCase(itemRepository: MockItemRepository(), output: output)
    
    try! sut.execute()
    
    #expect(output.didFetchItemsCalled == true)
    #expect(output.receivedItems.count == 1)
}



//MARK: Helper
func assertValid(_ item: Item) {
    #expect(!item.name.isEmpty)
    #expect(!item.description.isEmpty)
    #expect(item.price > 0)
    #expect(!item.imagesURL.isEmpty)
}


class MockItemRepository: ItemRepository {
    var itemsToReturn: [Item]
    init(itemsToReturn: [Item] = [Item.mockItemWithInvestment]) {
        self.itemsToReturn = itemsToReturn
    }
    func fetchItems() throws -> [Item] { itemsToReturn }
}

class MockOutPut: FetchAvailableItemsToInvestUseCaseOutput {
    var didFetchItemsCalled = false
    var didFailToFetchItemsCalled = false
    var receivedItems: [Item] = []
    var receivedError: Error?
    
    func didFetchItems(_ items: [Item]) {
        didFetchItemsCalled = true
        receivedItems = items
    }
    
    func didFailToFetchItems(_ error: any Error) {
        didFailToFetchItemsCalled = true
        receivedError = error
    }
}

extension Item {
    static var mockItemWithInvestment: Self {
        Item(id: UUID().uuidString,
             name: "Item",
             description: "some Description",
             price: 1, imagesURL: ["some url"],
             investment: Investment(minimumInvestmentAmount: 10,
                                    investors: ["", ""]))
    }
    
    static var mockItemWithOutInvestment: Self {
        Item(id: UUID().uuidString,
             name: "Item",
             description: "some Description",
             price: 1, imagesURL: ["some url"])
    }
}
