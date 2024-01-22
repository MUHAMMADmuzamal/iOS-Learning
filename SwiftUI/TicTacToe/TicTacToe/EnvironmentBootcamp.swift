//
//  EnvironmentBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 20/01/2024.
//

import SwiftUI
class EnvironmentVM: ObservableObject {
    @Published var dataArray: [String] = []
    init() {
        getData()
    }
    func getData() {
        self.dataArray.append(contentsOf: ["IPhone", "IPad", "IMAC"])
    }
}

struct EnvironmentBootcamp: View {
    @StateObject var viewModel: EnvironmentVM = EnvironmentVM()
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.dataArray, id: \.self) { item in
                    NavigationLink {
                        DetailView( selectedItem: item)
                    } label: {
                        Text(item)
                    }
                }
            }
            .navigationTitle(Text("iOS Devices"))
        }
        .environmentObject(viewModel)
    }
}

struct DetailView: View {
//    @ObservedObject var vm:EnvironmentVM
    let selectedItem: String
    var body: some  View {
        ZStack {
            Color.orange.ignoresSafeArea()
            NavigationLink(destination: FinalView()) {
                Text(selectedItem)
                    .foregroundStyle(Color.orange)
                    .font(.headline)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
        }
    }
}

struct FinalView: View {
//    @ObservedObject var vm:EnvironmentVM
    @EnvironmentObject var viewModel: EnvironmentVM
    var body: some  View {
        ZStack {
            LinearGradient(colors: [Color.red, Color.green], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(viewModel.dataArray, id: \.self) { data in
                        Text(data)
                    }
                }
                .font(.largeTitle)
                .foregroundColor(.white)
            }
         }
    }
}

#Preview {
    EnvironmentBootcamp()
}
