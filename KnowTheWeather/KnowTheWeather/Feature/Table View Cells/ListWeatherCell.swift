//
//  ListWeatherCell.swift
//  KnowTheWeather
//
//  Created by Nandini Saha on 2022-03-04.
//

import UIKit

class ListWeatherCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!    
    @IBOutlet weak var detailLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(_ vm: WeatherViewModel) {
        titleLbl.text = vm.cityName
        detailLbl.text = String(format: "%.0f", vm.temperature) + "°"
    }
}
