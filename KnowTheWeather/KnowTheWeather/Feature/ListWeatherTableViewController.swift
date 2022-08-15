//
//  ViewController.swift
//  KnowTheWeather
//
//  Created by Nandini Saha on 2022-03-03.
//

import UIKit

class ListWeatherTableViewController: UITableViewController, AddWeatherDelegate {
    
    private let listWeatherVM = ListWeatherViewModel()
    private var lastUnitSelection: Unit?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = UserDefaults.standard
        if let value = userDefaults.value(forKey: "unit") as? String {
            self.lastUnitSelection = Unit(rawValue: value)
        }
    }
    
    func addWeatherToList(_ vm: WeatherViewModel) {
        let index = listWeatherVM.numberOfRows()
        self.listWeatherVM.addWeather(vm)
        tableView.insertRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddWeatherVC" {
            settingDelegateforAddWeatherVC(segue)
        } else if segue.identifier == "toSettingsVC" {
            settingDelegateforSettingsVC(segue)
        }
    }
    
    func settingDelegateforAddWeatherVC(_ segue: UIStoryboardSegue) {
        if let navC = segue.destination as? UINavigationController {
            if let destinationVC = navC.viewControllers.first as? AddWeatherViewController {
                destinationVC.delegate = self
            }
        }
    }
    
    func settingDelegateforSettingsVC(_ segue: UIStoryboardSegue) {
        if let navC = segue.destination as? UINavigationController {
            if let destinationVC = navC.viewControllers.first as? SettingsTableViewController {
                destinationVC.delegate = self
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.listWeatherVM.numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListWeatherCell {
            let item = self.listWeatherVM.cellForRowAt(indexPath.row)
            cell.configureCell(item)
            return cell
        }        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if indexPath.row < listWeatherVM.numberOfRows() {
            listWeatherVM.delRows(indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

extension ListWeatherTableViewController: settingsDelegate {
    func settingDone(vm: SettingsViewModel) {
        if lastUnitSelection?.rawValue != vm.selectedUnit.rawValue {
            listWeatherVM.updateUnit(to: vm.selectedUnit)
            tableView.reloadData()
            lastUnitSelection = Unit(rawValue: vm.selectedUnit.rawValue)
        }
    }
}

