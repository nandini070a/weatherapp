//
//  ListWeatherViewModel.swift
//  KnowTheWeather
//
//  Created by Nandini Saha on 2022-03-03.
//

import Foundation

class ListWeatherViewModel {
    private var weatherList = [WeatherViewModel]()
    
    func addWeather(_ vm: WeatherViewModel) {
        weatherList.append(vm)
    }
    
    func numberOfRows() -> Int {
        return weatherList.count
    }
    
    func cellForRowAt(_ index: Int) -> WeatherViewModel {
        return weatherList[index]
    }
    
    func delRows(_ index: Int) {
        weatherList.remove(at: index)
    }
    
    func updateUnit(to unit: Unit) {
        switch unit {
        case .celsius:
            toCelsius()
        case .fahrenheit:
            toFahrenheit()
        }
    }
    
    private func toCelsius() {
        weatherList = weatherList.map { vm in
            let weatherModel = vm
            weatherModel.temperature = (weatherModel.temperature - 32) * 5/9
            return weatherModel
        }
    }
    
    private func toFahrenheit() {
        weatherList = weatherList.map({ vm in
            let weatherModel = vm
            weatherModel.temperature = (weatherModel.temperature * 9/5) + 32
            return weatherModel
        })
    }
}

class WeatherViewModel {
    let weather: WeatherResponse
    var temperature: Double
    
    init(_ weather: WeatherResponse) {
        self.weather = weather
        self.temperature = weather.main.temp
    }
    
    var cityName: String {
        return weather.name
    }
}
