//
//  AddWeatherViewController.swift
//  KnowTheWeather
//
//  Created by Nandini Saha on 2022-03-03.
//

import UIKit

protocol AddWeatherDelegate {
    func addWeatherToList(_ vm: WeatherViewModel)
}

class AddWeatherViewController: UIViewController {
    
    private let addWeatherVM = AddWeatherViewModel()
    var delegate: AddWeatherDelegate?
    
    @IBOutlet weak var cityTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveClicked(_ sender: UIButton) {
        if let city = cityTextField.text {
            guard !city.isEmpty else {return}
            addWeatherVM.getWeather(city) { weatherVM in
                self.delegate?.addWeatherToList(weatherVM)
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }
}
