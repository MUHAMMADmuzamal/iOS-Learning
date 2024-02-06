//
//  ViewModel Bootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 20/01/2024.
//

import SwiftUI

struct FruitModel: Identifiable {
    let id = UUID().uuidString
    let name: String
    let count: Int
}

class FruitViewModel: ObservableObject {
    @Published var fruitArray: [FruitModel] = []
    @Published var isLoading: Bool = false
    init() {
        getFruits()
    }
    func deleteFruit(indexSet: IndexSet) {
        fruitArray.remove(atOffsets: indexSet)
    }
    func getFruits() {
        let fruit1 = FruitModel(name: "watermelon", count: 99)
        let fruit2 = FruitModel(name: "Orange", count: 50)
        let fruit3 = FruitModel(name: "Banana", count: 1)
        let fruit4 = FruitModel(name: "Apple", count: 10)
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.fruitArray.append(fruit1)
            self.fruitArray.append(fruit2)
            self.fruitArray.append(fruit3)
            self.fruitArray.append(fruit4)
            self.isLoading = false
        }
    }
}

struct ViewModelBootcamp: View {
    // use this for subviews or passing to other screen
//    @ObservedObject var fruitVM:FruitViewModel = FruitViewModel()
    // use it when creating view
    @StateObject var fruitVM: FruitViewModel = FruitViewModel()
    var body: some View {
        NavigationStack {
            List {
                if fruitVM.isLoading {
                    ProgressView()
                }else {
                    ForEach(fruitVM.fruitArray, content: { fruit in
                        HStack {
                            Text(String(fruit.count))
                                .foregroundStyle(Color.red)
                            Text(fruit.name)
                                .font(.title)
                                .bold()
                        }
                    }).onDelete(perform: fruitVM.deleteFruit)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Fruit List")
            .navigationBarItems(trailing: NavigationLink(destination: SecondScreen(fruitVM: fruitVM), label: {
                Image(systemName: "arrow.right")
            }))
        }
    }
}

struct SecondScreen: View {
    @ObservedObject var fruitVM: FruitViewModel
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            VStack {
                ForEach(fruitVM.fruitArray) { fruit in
                    Text(fruit.name)
                }
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("GO Back")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
            }

        }
    }
}

#Preview {
    ViewModelBootcamp()
}
