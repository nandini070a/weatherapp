//
//  AddWeatherViewModel.swift
//  KnowTheWeather
//
//  Created by Nandini Saha on 2022-03-03.
//

import UIKit

class AddWeatherViewModel {
    
    func getWeather(_ city: String, completionHandler: @escaping (WeatherViewModel) -> Void) {
        guard let url = Constants.Urls.weatherUrlWithCityName(city) else {return}
        let weatherResource = Resource<WeatherResponse>(url: url) { data in
            return try? JSONDecoder().decode(WeatherResponse.self, from: data)
        }
        Webservice().fetch(resource: weatherResource) { result in
            switch result {
            case .success(let weather):
                if let weather = weather {
                    let weatherVM = WeatherViewModel(weather)
                    completionHandler(weatherVM)
                }
            case .failure(let weather):
                print("\(weather) not found!")
            }
        }
    }
}
