//
//  File.swift
//  InvestmentCore
//
//  Created by Muhammad Muzamal on 29/09/2025.
//

import Foundation

protocol ItemRepository {
    func fetchItems() throws -> [Item]
}

protocol FetchAvailableItemsToInvestUseCaseInput {
    var items: [Item] { get }
    
    func execute() throws
}

protocol FetchAvailableItemsToInvestUseCaseOutput {
    func didFetchItems(_ items: [Item])
    func didFailToFetchItems(_ error: Error)
}

final class FetchAvailableItemsToInvestUseCase: FetchAvailableItemsToInvestUseCaseInput {
    private(set) var items: [Item] = []
    let itemRepository: ItemRepository
    let output: FetchAvailableItemsToInvestUseCaseOutput
    
    init(itemRepository: ItemRepository, output: FetchAvailableItemsToInvestUseCaseOutput) {
        self.itemRepository = itemRepository
        self.output = output
    }
    
    func execute() throws {
        do {
            items = try itemRepository.fetchItems()
            output.didFetchItems(items)
        } catch let error {
            output.didFailToFetchItems(error)
        }
    }
}



