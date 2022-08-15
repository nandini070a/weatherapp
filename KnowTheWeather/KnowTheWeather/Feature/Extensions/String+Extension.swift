//
//  String+Extension.swift
//  KnowTheWeather
//
//  Created by Nandini Saha on 2022-03-03.
//

import Foundation

extension String {
    var stringByRemovingWhitespaces: String {
        let components = components(separatedBy: .whitespaces)
        return components.joined(separator: "")
        }
}
