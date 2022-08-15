//
//  SettingsTableViewCOntroller.swift
//  KnowTheWeather
//
//  Created by Nandini Saha on 2022-03-05.
//

import UIKit

protocol settingsDelegate {
    func settingDone(vm: SettingsViewModel)
}

class SettingsTableViewController: UITableViewController {
    
    private var settingsVM = SettingsViewModel()
    var delegate: settingsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settingsVM.units.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath)
        let settingItem = settingsVM.units[indexPath.row]
        cell.textLabel?.text = settingItem.displayName
        
        if settingItem == settingsVM.selectedUnit {
            cell.accessoryType = .checkmark
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //uncheck all cells
        tableView.visibleCells.forEach { cell in
            cell.accessoryType = .none
        }
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            let unit = Unit.allCases[indexPath.row]
            settingsVM.selectedUnit = unit
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
        
    @IBAction func doneClicked(_ sender: UIBarButtonItem) {
        if let delegate = self.delegate {
            delegate.settingDone(vm: settingsVM)
        }
        self.dismiss(animated: true, completion: nil)
    }
}
