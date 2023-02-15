//
//  Device.swift
//  SmartHome
//
//  Created by Chase on 2/15/23.
//

import Foundation

class Device: Codable {
    let name: String
    var isOn: Bool
    let id: UUID
    
    init(name: String, isOn: Bool = false, id: UUID = UUID()) {
        self.name = name
        self.isOn = isOn
        self.id = id
    }
}

extension Device: Equatable {
    static func == (lhs: Device, rhs: Device) -> Bool {
        return lhs.id == rhs.id
    }
}
