//
//  HomeView.swift
//  AppleWeatherAppClone
//
//  Created by Codes Orbit on 22/02/2024.
//

import SwiftUI

struct HomeView: View {
//    var vm: HomeScreenVMProtocol = HomeScreenVM(
//        homeRepository: HomeRepository(
//            homeNetworkProvider:HomeNetworkProvider())) 
//    var vm: AsyncHomeScreenVMProtocol = AsyncHomeScreenVM(
//        homeRepository: AsyncHomeRepository(
//            homeNetworkProvider: AsyncHomeNetworkProvider())) 
    @StateObject var vm: CombineHomeScreenVM = CombineHomeScreenVM(
        homeRepository: CombineHomeRepository(
            homeNetworkProvider: CombineHomeNetworkProvider(networkMonitoringService: NetworkMonitoringService())))
    
    var body: some View {
        ZStack {
            background
            ScrollView {
                VStack(alignment: .center) {
                    CurrentWeatherForecast(model: $vm.currentWeatherSectionState)
                        .padding(.top, 73)
                        .padding(.bottom, 44)
                        .onTapGesture {
                            vm.fetchWeatherData()
                        }
                    Group {
                        HourlyForecast()
                        DaysForeCast(daysForeCastList: $vm.daysForecastRowModelData)
                    }
                    .padding(.bottom, 8)
                    OtherComponents()
                        .padding(.bottom, 100)
                }
            }
            .padding(.top, 60)
            .scrollIndicators(.never)
           
        }
        .ignoresSafeArea(.all)
    }
    var background: some View {
        ZStack {
            LinearGradient(colors: [Color("GradientColor-1"),
                                    Color("GradientColor-2")],
                                    startPoint: .bottom,
                                    endPoint: .top)
            VStack {
                ZStack {
                    Group {
                        Image("cloudImage")
                            .resizable()
                        Image("starsImage")
                            .resizable()
                    }
                .scaledToFit()
                }
                Spacer()
            }
            Rectangle()
                .fill(LinearGradient(
                    colors: [
                        Color(hex: "#1C232B").opacity(0.0),
                        Color(hex: "#1C232B"),
                        Color(hex: "#1C232B"),
                        Color(hex: "#1C232B").opacity(0.0)
                    ],
                    startPoint: .top,
                    endPoint: .bottom)
                )
                .padding(.top, 300)
                .padding(.bottom, 78)
        }
        .onAppear {
            vm.fetchWeatherData()
//            Task {
//                await vm.fetchWeatherData()
//            }
        }
    }
}
#Preview {
    HomeView()
}
