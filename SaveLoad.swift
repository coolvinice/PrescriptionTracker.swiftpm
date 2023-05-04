//
//  SaveLoad.swift
//  PrescriptionTracker
//
//  Created by Calvin Rice on 5/4/23.
//

import SwiftUI

struct SaveLoad {
    func saveArrays(rx: [Prescription], otc: [OTCMed]) {
        if let encoded = try? JSONEncoder().encode(rx){
            UserDefaults.standard.set(encoded, forKey: "prescriptions")
        } else {
            print("Error Saving Prescriptions")
        }
    }
    
    func loadArrays() -> ([Prescription], [OTCMed]) {
        var loadedRX: [Prescription] = []
        var loadedOTC: [OTCMed] = []
        if let object = UserDefaults.standard.value(forKey: "prescriptions") as? Data {
            if let decoded = try? JSONDecoder().decode(Array.self, from: object) as [Prescription] {
                loadedRX = decoded
            }
        } else {
            print("Error Loading Prescriptions")
        }
        
        if let object = UserDefaults.standard.value(forKey: "otc") as? Data {
            if let decoded = try? JSONDecoder().decode(Array.self, from: object) as [OTCMed] {
                loadedOTC = decoded
            }
        } else {
            print("Error Loading Over-the-Counter Medications")
        }
        
        return (loadedRX, loadedOTC)
    }
}
