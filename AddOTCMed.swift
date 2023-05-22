import Foundation
import SwiftUI

struct AddOTCMed: View {
    @State var brandName : String  = ""
    @State var medicineName : String  = ""
    @State var doseAmount : Int =  0
    @State var doseFrequency : Int  = 0
    @State var doseFrequency2 : Int = 0
    @Binding var otcMeds : [OTCMed]
    @Binding var prescriptions : [Prescription]
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            VStack {
                List {
                    DetailTextField(title: "Brand Name", prompt: "Brand Name", boundString: $brandName)
                        .disableAutocorrection(true)
                        .font(
                            .title
                            .weight(.semibold)

                        )
                    DetailTextField(title: "Medicine Name", prompt: "Medicine Name", boundString: $medicineName)
                        .disableAutocorrection(true)
                        .font(
                            .title
                            .weight(.semibold)

                        )
                    DetailIntField(title: "Dose Amount (mg)", prompt: "Dose Amount", boundVar: $doseAmount)
                        .disableAutocorrection(true)
                        .font(
                            .title
                            .weight(.semibold)

                        )
                    DetailIntField(title: "Dose Frequency (Hours)", prompt: "Dose Frequency", boundVar: $doseFrequency)
                        .disableAutocorrection(true)
                        .font(
                            .title
                            .weight(.semibold)

                        )
                    Button {
                        dismiss()
                        otcMeds.append(OTCMed(id: otcMeds.count, medName: medicineName, brandName: brandName, doseAmount: doseAmount, doseFrequency: doseFrequency, doseFrequency2: doseFrequency2, timerRunning: false, lastDose: Date.now))
                        SaveLoad().saveArrays(rx: prescriptions, otc: otcMeds)
                    } label: {
                        Text("Save")
                            .font(
                                .title
                                .weight(.semibold)

                            )
                    }
                }
            }
        }
    }
}
