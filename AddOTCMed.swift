//
//  AddOTCMed.swift
//  PrescriptionTracker
//
//  Created by Dylan Domeracki on 4/28/23.
//

import Foundation
import SwiftUI

struct AddOTCMed: View {
    @Binding var med: OTCMed
    var body: some View {
        ZStack {
            VStack {
                DetailTextField(title: "Brand Name", prompt: "Lexapro", boundString: $med.brandName)
                DetailTextField(title: "Medicine Name", prompt: "Escitalopram", boundString: $med.medName)
                DetailIntField(title: "Dose Amount (mg)", prompt: "7", boundVar: $med.doseAmount)
                DetailIntField(title: "Dose Frequency (Hours)", prompt: "24", boundVar: $med.doseFrequency)
            }
            
            VStack {
                Rectangle()
                    .frame(width: .infinity, height: 70)
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
