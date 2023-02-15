//
//  DeviceTableViewCell.swift
//  SmartHome
//
//  Created by Chase on 2/15/23.
//

import UIKit

protocol DeviceTableViewCellDelegate: AnyObject {
    
    func isOnSwitchWasToggled(cell: DeviceTableViewCell)
    
}

class DeviceTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var deviceNameLabel: UILabel!
    
    @IBOutlet weak var deviceSwitch: UISwitch!
    
    // MARK: - Properties
    
    weak var delegate: DeviceTableViewCellDelegate?
    
    // MARK: - Helper Function
    
    func updateViews(device: Device) {
        deviceNameLabel.text = device.name
        deviceSwitch.isOn = device.isOn
    }
    
    
    // MARK: - Action
    
    @IBAction func switchToggled(_ sender: Any) {
        delegate?.isOnSwitchWasToggled(cell: self)
    }
}
