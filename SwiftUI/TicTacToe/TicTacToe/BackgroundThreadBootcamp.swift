//
//  BackgroundThreadBootcamp.swift
//  TicTacToe
//
//  Created by Codes Orbit on 08/02/2024.
//

import SwiftUI
class BackgroundThreadViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    func fetchData() {
        DispatchQueue.global(qos: .background).async {
            let newData = self.downloadData()
            print("CHECK-1 \(Thread.isMainThread)")
            print("CHECK-1 \(Thread.current)")
            DispatchQueue.main.async {
                self.dataArray = newData
                print("CHECK-2 \(Thread.isMainThread)")
                print("CHECK-2 \(Thread.current)")
            }
        }
    }
    private func downloadData() -> [String] {
        var data: [String] = []
        for count in 0..<100 {
            data.append("\(count )")
            print(data)
        }
        return data
    }
}

struct BackgroundThreadBootcamp: View {
    @StateObject var viewModel: BackgroundThreadViewModel = BackgroundThreadViewModel()
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                Text("Load Data")
                    .font(.largeTitle)
                    .fontWeight(.semibold )
                    .onTapGesture {
                        viewModel.fetchData()
                    }
                ForEach(viewModel.dataArray, id: \.self) { item in
                    Text(item)
                        .font(.headline)
                        .foregroundStyle(Color.red)
                }
            }
        }
    }
}

#Preview {
    BackgroundThreadBootcamp()
}
