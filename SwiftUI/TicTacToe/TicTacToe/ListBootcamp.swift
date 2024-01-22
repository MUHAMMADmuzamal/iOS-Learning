//
//  ListBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 30/10/2023.
//

import SwiftUI

struct ListBootcamp: View {
    @State var fruits:[String] = [
    "apple", "banana", "peach", "mango",
    ]
    @State var veggies:[String] = [
    "tomato", "pattato", "carrot",
    ]
    var body: some View {
        NavigationView {
            List{
                Section(
                    header:
                        HStack {
                            Text("Fruits")
                            Image(systemName: "flame.fill")
                        }
                        .font(.headline)
                        .foregroundColor(.orange)
                ) {
                    ForEach(fruits, id: \.self) { fruit in
                        Text(fruit.capitalized)
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding(.vertical)
//                            .frame(maxWidth: .infinity, maxHeight:.infinity)
//                            .background(Color.pink)
                        
                            
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                    .listRowBackground(Color.pink)
//                    .onMove(perform: { indices, newOffset in
//                        fruits.move(fromOffsets: indices, toOffset: newOffset)
//                    })
    //                .onDelete(perform: {
    //                    indexSet in
    //                    delete(indexSet: indexSet)
    //                })
              
                }
                Section(header: Text("Veigtables")) {
                    ForEach(veggies, id: \.self) { veggies in
                        Text(veggies.capitalized)
                    }
                }
            }
            .accentColor(.purple)
//            .listStyle(.sidebar)
            .navigationBarTitle("Grocery List")
            .navigationBarItems(leading: EditButton(), trailing: addButton)
//            .navigationBarItems(leading: EditButton())
        }
        .accentColor(.red)
    }
    
    var addButton:  some View{
        Button("Add"){
            add()
        }
    }
    func delete(indexSet:IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
    
    func move(indices: IndexSet, newOffset: Int) {
        fruits.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func add(){
        fruits.append("Coconut")
    }
}

struct ListBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ListBootcamp()
    }
}
