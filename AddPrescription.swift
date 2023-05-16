import Foundation
import SwiftUI

struct AddPrescription: View {
    @State var brandName : String  = ""
    @State var medicineName : String  = ""
    @State var doseAmount : Int =  0
    @State var doseFrequency : Int  = 0
    @Binding var otcMeds : [OTCMed]
    @Binding var prescriptions : [Prescription]
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            VStack {
                List {
                    DetailTextField(title: "Brand Name", prompt: "Brand Name", boundString: $brandName)
                        .disableAutocorrection(true)
                    DetailTextField(title: "Medicine Name", prompt: "Medicine Name", boundString: $medicineName)
                        .disableAutocorrection(true)
                    DetailIntField(title: "Dose Amount (mg)", prompt: "Dose Amount", boundVar: $doseAmount)
                        .disableAutocorrection(true)
                    DetailIntField(title: "Dose Frequency (Hours)", prompt: "Dose Frequency", boundVar: $doseFrequency)
                        .disableAutocorrection(true)
                    Button {
                        dismiss()
                        prescriptions.append(Prescription(id: prescriptions.count, medName: medicineName, brandName: brandName, doseAmount: doseAmount, doseFrequency: doseFrequency, hasTaken: false))
                        SaveLoad().saveArrays(rx: prescriptions, otc: otcMeds)
                    } label: {
                        Text("Save")
                    }
                }
            }
        }
    }
}
