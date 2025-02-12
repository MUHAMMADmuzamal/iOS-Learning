//
//  CountryListView.swift
//  Tidoy
//
//  Created by Codes Orbit on 20/08/2024.
//

import SwiftUI

struct CountryListView: View {
    @StateObject var viewModel: CountryListVM = CountryListVM()
    let action: ((CountryModel?) -> Void)
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Country")
                    .foregroundStyle(Color.text100)
                    .font(.heading6)
                Spacer()
                XmarkButton()
            }
            SearchField(searchText: $viewModel.searchText)
                .padding()
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    ForEach(viewModel.countriesList, id: \.code) { country in
                        CountryListRow(flag: country.flag,
                                       code: country.code,
                                       name: country.name,
                                       isSelected: viewModel.isSelected(country: country))
                            .onTapGesture {
                                viewModel.selectedCountry(country: country)
                                action(viewModel.selectedCountry)
                            }
                    }
                }
            }
            .background(.background10)
            .padding(.top, 16)
            .padding(.bottom, 48)
        }
        .padding(.horizontal, 16)
        .padding(.top, 45)
        .background(Color.background10)
        .clipShape(CustomRoundedRectangle(cornerRadius: 32, corners: [.topLeft, .topRight]))
        .ignoresSafeArea()
        
    }
}

struct Corners: OptionSet {
    let rawValue: Int
    
    static let topLeft     = Corners(rawValue: 1 << 0)
    static let topRight    = Corners(rawValue: 1 << 1)
    static let bottomLeft  = Corners(rawValue: 1 << 2)
    static let bottomRight = Corners(rawValue: 1 << 3)
    
    static let top: Corners = [.topLeft, .topRight]
    static let bottom: Corners = [.bottomLeft, .bottomRight]
    static let all: Corners = [.topLeft, .topRight, .bottomLeft, .bottomRight]
}

struct CustomRoundedRectangle: Shape {
    var cornerRadius: CGFloat
    var corners: Corners

    func path(in rect: CGRect) -> Path {
        var path = Path()

        // Start from top-left corner
        path.move(to: CGPoint(x: rect.minX + (corners.contains(.topLeft) ? cornerRadius : 0), y: rect.minY))

        // Top-right corner
        path.addLine(to: CGPoint(x: rect.maxX - (corners.contains(.topRight) ? cornerRadius : 0), y: rect.minY))
        if corners.contains(.topRight) {
            path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY + cornerRadius),
                        radius: cornerRadius,
                        startAngle: Angle(degrees: 270),
                        endAngle: Angle(degrees: 0),
                        clockwise: false)
        }

        // Bottom-right corner
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - (corners.contains(.bottomRight) ? cornerRadius : 0)))
        if corners.contains(.bottomRight) {
            path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius),
                        radius: cornerRadius,
                        startAngle: Angle(degrees: 0),
                        endAngle: Angle(degrees: 90),
                        clockwise: false)
        }

        // Bottom-left corner
        path.addLine(to: CGPoint(x: rect.minX + (corners.contains(.bottomLeft) ? cornerRadius : 0), y: rect.maxY))
        if corners.contains(.bottomLeft) {
            path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY - cornerRadius),
                        radius: cornerRadius,
                        startAngle: Angle(degrees: 90),
                        endAngle: Angle(degrees: 180),
                        clockwise: false)
        }

        // Back to top-left corner
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + (corners.contains(.topLeft) ? cornerRadius : 0)))
        if corners.contains(.topLeft) {
            path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y: rect.minY + cornerRadius),
                        radius: cornerRadius,
                        startAngle: Angle(degrees: 180),
                        endAngle: Angle(degrees: 270),
                        clockwise: false)
        }

        path.closeSubpath()

        return path
    }
}


struct CountryListRow: View {
    let flag: String
    let code: String
    let name: String
    let isSelected: Bool
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Group {
                    Text(flag)
                    Text("(\(code))")
                    Text(name)
                }
                .font(.bodyMediumMedium)
                .foregroundStyle(.text100)
                Spacer()
                if isSelected {
                    Circle()
                        .stroke()
                        .fill(.infoMain)
                        .frame(width: 16)
                        .overlay {
                            Circle()
                                .fill(.infoMain)
                                .frame(width: 8)
                        }
                } else {
                    Circle()
                        .stroke()
                        .fill(.stroke50)
                        .frame(width: 16)
                }
                
            }
            .padding(.all, 12)
        }
        .background(.background10)
        Divider()
            .background(.neutral40)
    }
}

#Preview {
    CountryListView { country in
        print("\(country?.name)")
    }
}
