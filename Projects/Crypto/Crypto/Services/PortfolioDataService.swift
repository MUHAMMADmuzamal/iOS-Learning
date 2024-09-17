//
//  PortfolioDataService.swift
//  Crypto
//
//  Created by Codes Orbit on 17/09/2024.
//

import Foundation
import CoreData

class PortfolioDataService {
    
    private let container:NSPersistentContainer
    private let containerName: String = "PortfolioContainer"
    private let entityName: String = "PortfolioEntity"
    
    @Published var savedEntities:[PortfolioEntity] = []
    
    init() {
        self.container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { _, error in
            if let error = error {
                debugPrint("Error Loading data from core data \(error)")
            }
        }
        self.getPortfolio()
    }
    //MARK: PUBLIC
    func updatePortfolio(coin: CoinModel, amount: Double) {
        
        if let entity = savedEntities.first(where: {$0.coinId == coin.id}) {
            if amount > 0 {
                update(entity: entity, amount: amount)
            }else {
                delete(entity: entity)
            }
        }else {
            add(coin: coin, amount: amount)
        }
    }
    
    //MARK: PRIVATE
    private func getPortfolio() {
        let request = NSFetchRequest<PortfolioEntity>(entityName: entityName)
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            debugPrint("Error fetching portfolio entity \(error) ")
        }
    }
    
    private func add(coin: CoinModel, amount: Double) {
        let entity = PortfolioEntity(context: container.viewContext)
        entity.coinId = coin.id
        entity.amount = amount
        applyChanges()
    }
    
    private func update(entity: PortfolioEntity, amount: Double) {
        entity.amount = amount
        applyChanges()
    }
    
    private func delete(entity: PortfolioEntity) {
        container.viewContext.delete(entity)
        applyChanges()
    }
    
    private func save() {
        do {
            try container.viewContext.save()
        } catch let error {
            debugPrint("error saving data to core data \(error)")
        }
    }
    
    private func applyChanges() {
        save()
        getPortfolio()
    }
}
