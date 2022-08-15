//
//  Weather.swift
//  KnowTheWeather
//
//  Created by Nandini Saha on 2022-03-03.
//

import Foundation

struct WeatherResponse: Codable {
    let name: String
    let main: Weather
}

struct Weather: Codable {
    let temp: Double
    let humidity: Double
}
