//
//  Constant.swift
//  KnowTheWeather
//
//  Created by Nandini Saha on 2022-03-03.
//

import Foundation

struct Constants {
    
    struct Urls {
        static func weatherUrlWithCityName(_ city: String) -> URL? {
            let userDefaults = UserDefaults.standard
            let unit = (userDefaults.value(forKey: "unit") as? String) ?? "imperial"
            
            guard let urlString = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.stringByRemovingWhitespaces)&appid=284d7a70e9578c07b9fde475d4a330bf&units=\(unit)") else {return nil}
            return urlString
        }
    }
}
