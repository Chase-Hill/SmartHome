//
//  DeviceController.swift
//  SmartHome
//
//  Created by Chase on 2/15/23.
//

import Foundation

class DeviceController {
    
    // MARK: - Properties
    
    static let shared = DeviceController()
    
    var devices: [Device] = []
    
    // MARK: - CRUD Functions
    
    func create(deviceName: String) {
        let device = Device(name: deviceName)
        devices.append(device)
    }
    
    func toggleIsOn(device: Device) {
        device.isOn.toggle()
        save()
    }
    
    // MARK: - Persistence
    
    private var fileURL: URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        let finalURL = documentsDirectory.appendingPathComponent("devices.json")
        return finalURL
    }
    
    func save() {
        // 1: Get the address to save the file to
        guard let saveLocation = fileURL else { return }
        // 2: Convert the Swift struct or class inot JSON Data
        do {
            let jsonData = try JSONEncoder().encode(devices)
            // 3: save (write) the data to the address from step 1
            try jsonData.write(to: saveLocation)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func load() {
        // 1. Get the address the data is saved at
        guard let url = fileURL else {return}
        // 2. Load that JSON data from the address
        do {
            let retrievedJSONData = try Data(contentsOf: url)
            // 3. Convert from JSON to our Swift Model Object Type
            let decodedDevices = try JSONDecoder().decode([Device].self, from: retrievedJSONData)
            self.devices = decodedDevices
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}
