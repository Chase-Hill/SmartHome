//
//  DeviceTableViewController.swift
//  SmartHome
//
//  Created by Chase on 2/15/23.
//

import UIKit

class DeviceTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DeviceController.shared.devices.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "deviceCell", for: indexPath) as? DeviceTableViewCell else { return UITableViewCell() }
        
        let device = DeviceController.shared.devices[indexPath.row]

        return cell
    }

    private func presentNewDeviceAlertController() {
        let alertController = UIAlertController(title: "New Device", message: "Enter the name of your device below", preferredStyle: .alert)
        
        alertController.addTextField { textfield in
            textfield.placeholder = "Add name here..."
        }
        
        let dismissAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { _ in
            guard let messageTextField = alertController.textFields?.first,
                  let messageContent = messageTextField.text, !messageContent.isEmpty else { return }
            DeviceController.shared.create(deviceName: messageContent)
            self.tableView.reloadData()
        }
        
        alertController.addAction(dismissAction)
        
        alertController.addAction(confirmAction)
        
        present(alertController, animated: true)
        
    }
    
    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

     */
}
