//
//  MapScreen.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 24/04/2025.
//

import SwiftUI
import MapKit
import Swinject

struct MapScreen<VM: MapScreenVMProtocol>: View {
    
    private let screenWidth = UIScreen.screenWidth
    @State var position: MapCameraPosition = .automatic
    
    @StateObject private var viewModel: VM
    
    init(viewModel: VM) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            MapView(locations: DefaultCardModel.mapSampleData, position: $position)
            
            VStack {
                backButtonSection
            
                Spacer()
                
                cardSection
            }
        }
        .toolbarVisibility(.hidden)
    }
    
    private var cardSection: some View {
        ScrollView(.horizontal) {
            HStack(spacing: .padding12) {
                ForEach(viewModel.dataSource) { data in
                    DefaultCard(height: 172, width: screenWidth - .padding32, model: data)
                        .onTapGesture {
                            position = .camera(
                                MapCamera(
                                    centerCoordinate: data.coordinates,
                                    distance: 800,
                                    heading: 0,
                                    pitch: 45
                                )

                            )
                        }
                }
            }
            .padding(.leading, .padding12)
        }
    }
    
    private var backButtonSection: some View {
        HStack(alignment: .center) {
            BackButton() {
                viewModel.goBack()
            }
                .padding(.leading, .padding16)
            Spacer()
        }
    }
}

#Preview {
    MapScreen(viewModel: MapScreenVM(router: MapScreenRouter(injector: DependenciesHolder.shared.injector())))
}
