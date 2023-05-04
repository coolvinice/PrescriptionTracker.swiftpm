//
//  AddOTCMed.swift
//  PrescriptionTracker
//
//  Created by Dylan Domeracki on 4/28/23.
//

import Foundation
import SwiftUI

struct AddOTCMed: View {
    @State var brandName : String  = ""
    @State var medicineName : String  = ""
    @State var doseAmount : Int =  0
    @State var doseFrequency : Int  = 0
    @Binding var Medication : [OTCMed]
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            VStack {
                List {
                    DetailTextField(title: "Brand Name", prompt: "Brand Name", boundString: $brandName)
                    DetailTextField(title: "Medicine Name", prompt: "Medicine Name", boundString: $medicineName)
                    DetailIntField(title: "Dose Amount (mg)", prompt: "Dose Amount", boundVar: $doseAmount)
                    DetailIntField(title: "Dose Frequency (Hours)", prompt: "Dose Frequency", boundVar: $doseFrequency)
                    Button {
                        dismiss()
                        Medication.append(OTCMed(id: Medication.count, medName: medicineName, brandName: brandName, doseAmount: doseAmount, doseFrequency: doseFrequency, timerRunning: false))
                    } label: {
                        Text("Save")
                    }
                }
            }
            
            
            VStack {
                Rectangle()
                    .frame(width: .infinity, height: 50)
                    .foregroundColor(.indigo)

                Spacer()
                Rectangle()
                    .frame(width: .infinity, height: 100)
                    .foregroundColor(.indigo)
            }
            .ignoresSafeArea()
            .frame(width: .infinity, height: .infinity)
        }
    }
}
