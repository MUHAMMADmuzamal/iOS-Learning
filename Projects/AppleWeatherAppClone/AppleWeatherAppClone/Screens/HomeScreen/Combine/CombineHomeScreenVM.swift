//
//  CombineHomeScreenVM.swift
//  AppleWeatherAppClone
//
//  Created by Codes Orbit on 29/03/2024.
//

import Foundation
import Combine

protocol CombineHomeScreenVMProtocol: ObservableObject {
    func fetchWeatherData()
}
class CombineHomeScreenVM: CombineHomeScreenVMProtocol {
    var homeRepository: CombineHomeRepositoryProtocol
    var cancelable = Set<AnyCancellable>()
    @Published var currentWeatherSectionState: CurrentWeatherForecastModel = CurrentWeatherForecastModel(
        cityName: "Seongnam-si",
        temperature: 21,
        weatherType: "Partly Cloudy",
        highTemperature: 29,
        lowTemperature: 15)
    
    @Published var daysForecastRowModelData: [DayRowForeCast] = []
    
    
    init(homeRepository: CombineHomeRepositoryProtocol) {
        self.homeRepository = homeRepository
        fakeDailyData()
    }
    
    func fetchWeatherData() {
      let response = self.homeRepository.getWeatherData()
        response.sink { completion in
            debugPrint("View Model completion ----- : ", completion)
        } receiveValue: { [weak self] data in
            switch data {
            case .success(let model):
                debugPrint("View Model Data ----- : ",model)
                self?.currentWeatherSectionState.temperature = Int(model.current.temperature2M)
            case.failure(let error):
                debugPrint(error)
            }
        }.store(in: &cancelable)

    }
}

extension CombineHomeScreenVM {
    func fakeDailyData() {
        self.daysForecastRowModelData = [
           DayRowForeCast(temperature: "10",
                          rainPercentage: 27,
                          day: "Mon",
                          minTemperature: 15,
                          maxTemperature: 25,
                          uvIndex: 10,
                          iconName: "cloud.drizzle"),
           DayRowForeCast(temperature: "25",
                          rainPercentage: 7,
                          day: "Tue",
                          minTemperature: 10,
                          maxTemperature: 20,
                          uvIndex: 10,
                          iconName: "cloud.drizzle"),
           DayRowForeCast(temperature: "25",
                          rainPercentage: 7,
                          day: "Wed",
                          minTemperature: 10,
                          maxTemperature: 20,
                          uvIndex: 10,
                          iconName: "cloud.drizzle"),
           DayRowForeCast(temperature: "27",
                          rainPercentage: nil,
                          day: "Thu",
                          minTemperature: 1,
                          maxTemperature: 35,
                          uvIndex: 4,
                          iconName: "sun.max.fill"),
           DayRowForeCast(temperature: "27",
                          rainPercentage: nil,
                          day: "Fri",
                          minTemperature: 1,
                          maxTemperature: 35,
                          uvIndex: 4,
                          iconName: "sun.max.fill"),
           DayRowForeCast(temperature: "27",
                          rainPercentage: nil,
                          day: "Sat",
                          minTemperature: 1,
                          maxTemperature: 35,
                          uvIndex: 4,
                          iconName: "sun.max.fill"),
           DayRowForeCast(temperature: "27",
                          rainPercentage: nil,
                          day: "Sun",
                          minTemperature: 1,
                          maxTemperature: 35,
                          uvIndex: 4,
                          iconName: "sun.max.fill")
       ]
    }
}
