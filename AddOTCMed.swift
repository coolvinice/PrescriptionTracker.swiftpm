//
//  AddOTCMed.swift
//  PrescriptionTracker
//
//  Created by Dylan Domeracki on 4/28/23.
//

import Foundation
import SwiftUI

struct AddOTCMed: View {
    var BrandName : String
    var MedicineName : String
    var DoseAmount : Int
    var DoseFrequency : Int
    var body: some View {
        ZStack {
            VStack {
                DetailTextField(title: "Brand Name", prompt: "Brand Name", boundString: $BrandName)
                DetailTextField(title: "Medicine Name", prompt: "Medicine Name", boundString: $MedicineName)
                DetailIntField(title: "Dose Amount (mg)", prompt: "Dose Amount", boundVar: $DoseAmount)
                DetailIntField(title: "Dose Frequency (Hours)", prompt: "Dose Frequency", boundVar: $DoseFrequency)
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
