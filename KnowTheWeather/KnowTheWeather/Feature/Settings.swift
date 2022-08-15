//
//  Settings.swift
//  KnowTheWeather
//
//  Created by Nandini Saha on 2022-03-05.
//

//import Foundation
//
//enum Unit: String, CaseIterable {
//    case celsius = "Celsius"
//    case fahrenheit = "Fahrenheit"
//}
//
//struct Settings {
//    var unit: String
//    var done: Bool
//
//    init() {
//        self.unit = Unit.celsius.rawValue
//        self.done = false
//    }
//
//    init?(_ plist: [String: Any]?) {
//        guard let plist = plist,
//              let unit = plist["unit"] as? String,
//              let done = plist["done"] as? Bool
//        else {return nil}
//        self.unit = unit
//        self.done = done
//    }
//
//    func toPlist(_ itemForPlist: (String, Bool)) -> [String: Any] {
//        return ["unit": self.unit, "done": self.done]
//    }
//}
