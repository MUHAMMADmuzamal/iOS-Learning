//
//  ListView.swift
//  CustomPublisersExample
//
//  Created by Codes Orbit on 27/03/2024.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        List(viewModel.jobs) { job in
            VStack(alignment: .leading) {
                Text("Company: \(job.company)")
                    .font(.headline)
                Text("Position: \(job.title)")
                    .foregroundColor(.gray)
            }.padding(8)
        }.onAppear { self.viewModel.load() }
    }
}

#Preview {
    ListView()
}
