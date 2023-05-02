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
                DetailTextField(title: "Brand Name", prompt: "Brand Name", boundString: $brandName)
                DetailTextField(title: "Medicine Name", prompt: "Medicine Name", boundString: $medicineName)
                DetailIntField(title: "Dose Amount (mg)", prompt: "Dose Amount", boundVar: $doseAmount)
                DetailIntField(title: "Dose Frequency (Hours)", prompt: "Dose Frequency", boundVar: $doseFrequency)
                NavigationLink {
                    ContentView()
                } label: {
                    ZStack{
                        Rectangle()
                            .frame(width: 100, height: 60)
                            .foregroundColor(.indigo)
                        Button("Save"){
                            dismiss()
                            Medication.append(OTCMed(id: Medication.count, medName: medicineName, brandName: brandName, doseAmount: doseAmount, doseFrequency: doseFrequency, timerRunning: false))
                        }
                            .foregroundColor(.white)
                    }
                    
                }
//                .navigationBarBackButtonHidden(true)
            }
            
            
            
            VStack {
                Rectangle()
                    .frame(width: .infinity, height: 60)
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
