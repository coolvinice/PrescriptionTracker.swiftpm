//
//  MainView.swift
//  PrescriptionTracker
//
//  Created by Alan Muszynski on 5/2/23.
//

import SwiftUI

struct MainView: View {
    @State var NewMedicationName: String = ""
    @State var NewMedicationHoursPerUse: Double?
    @Binding var tempArray: [Medicine]
    var body: some View {
        HStack{
            TextField("Enter Medication Here", text: $NewMedicationName)
            TextField("Enter Hours Per Use Here", value: $NewMedicationHoursPerUse, format: .number)
            Button {
                guard let unwrappedHoursPerUse = NewMedicationHoursPerUse else { return }
                let NewMedication = Medicine(name: NewMedicationName, HoursPerUse: unwrappedHoursPerUse)
                tempArray.append(NewMedication)
                NewMedicationName = ""
                NewMedicationHoursPerUse = nil
            } label: {
                Image(systemName: "plus.square")
                    .font(.largeTitle)
            }
            
        }
        .padding()
        .textFieldStyle(.roundedBorder)
    }
    }


