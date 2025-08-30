//
//  ContentView.swift
//  FetchRequestCoreData
//
//  Created by Muhammad Muzamal on 29/08/2025.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: FruitEntity.entity(),
                  sortDescriptors: [
                    NSSortDescriptor(keyPath: \FruitEntity.name, ascending: true)
    ])
    var fruits: FetchedResults<FruitEntity>
    
    @State private var newFruitName: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                
                TextField("Add a fruit name", text: $newFruitName)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                
                Button(action: {
                    addItem()
                }) {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(.blue)
                        .foregroundStyle(.black)
                        .cornerRadius(10)
                }
                
                List {
                    ForEach(fruits) { fruit in
                        Text(fruit.name ?? "No Fruit")
                            .onTapGesture {
                                updateItem(fruit)
                            }
                    }
                    .onDelete(perform: deleteItems)
                }
                .navigationTitle("Fruits")
                
           
            }
            .padding(.horizontal, 20)
        }
    }

    private func addItem() {
        guard !newFruitName.isEmpty else { return }

        withAnimation {
            let newItem = FruitEntity(context: viewContext)
            newItem.name = newFruitName
            saveItems()
            newFruitName = ""
        }
    }
    
    private func updateItem(_ fruit: FruitEntity) {
        withAnimation {
            let currentName = fruit.name ?? ""
            let newName = currentName + " (Updated)"
            fruit.name = newName
            saveItems()
            
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            guard let index = offsets.first else { return }
            let fruitEntity = fruits[index]
            viewContext.delete(fruitEntity)
//            offsets.map { fruits[$0] }.forEach(viewContext.delete)
            saveItems()
        }
    }
    
    private func saveItems() {
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
