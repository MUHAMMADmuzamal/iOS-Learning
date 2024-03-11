//
//  CampusView.swift
//  AppleWeatherAppClone
//
//  Created by Codes Orbit on 10/03/2024.
//

import SwiftUI

struct CampusView: View {
    var body: some View {
        ZStack(alignment: .center) {
            GeometryReader {geometry in
                let bigSpace = 564.0
                let barSize = 200.0
                let lineWidth = 20.0
                VStack {
                    Text("\(geometry.size.width) - \(geometry.size.height)")
                    Circle()
                        .stroke(style: .init(lineWidth: lineWidth,
                                             dash: [barSize]))
                        .frame(width: 200, height: 200)
                        .foregroundStyle(Color.white.opacity(0.15))
                        .overlay {
                            Circle()
                                .stroke(style: .init(lineWidth: lineWidth,dash: [barSize,bigSpace]))
                                .foregroundStyle(Color.white)
                        }
                        .overlay {
                            VStack {
                                Text("N")
                                Spacer()
                                HStack {
                                    Text("W")
                                    Spacer()
                                    VStack {
                                        Text("1")
                                            .font(.largeTitle)
                                        Text("m/s")
                                            .font(.caption)
                                    }
                                    Spacer()
                                    Text("E")
                                }
                                Spacer()
                                Text("S")
                            }
                            .padding()
                            .font(.title)
                            .bold()
                    }
                }
            }
        }
        .padding()
        .foregroundStyle(Color.white)
    }
}

#Preview {
    ZStack {
        Color.blue
        CampusView()
    }
}
