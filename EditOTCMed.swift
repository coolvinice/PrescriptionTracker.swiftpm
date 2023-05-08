import SwiftUI

struct EditOTCMed: View {
    @Binding var med: OTCMed
    @Binding var rxArray: [Prescription]
    @Binding var otcArray: [OTCMed]
    @Environment(\.dismiss) private var dismiss
    @State var brand: String = ""
    @State var name: String = ""
    @State var amount: Int = 0
    @State var frequency: Int = 0

    var body: some View {
        ZStack {
            VStack {
                List {
                    DetailTextField(title: "Brand Name", prompt: "Lexapro", boundString: $brand)
                    DetailTextField(title: "Medicine Name", prompt: "Escitalopram", boundString: $name)
                    DetailIntField(title: "Dose Amount (mg)", prompt: "7", boundVar: $amount)
                    DetailIntField(title: "Dose Frequency (Hours)", prompt: "24", boundVar: $frequency)
                    Section {
                        Button {
                            med.brandName = brand
                            med.medName = name
                            med.doseAmount = amount
                            med.doseFrequency = frequency
                            SaveLoad().saveArrays(rx: rxArray, otc: otcArray)
                            dismiss()
                        } label: {
                            Text("Save")
                        }
                        Button {
                            if let index = otcArray.firstIndex(of: med){
                                otcArray.remove(at: index)
                            }
                            SaveLoad().saveArrays(rx: rxArray, otc: otcArray)
                            dismiss()   
                        } label: {
                            Text("Delete")
                        }
                    }

                }
            }
            .onAppear() {
                brand = med.brandName
                name = med.medName
                amount = med.doseAmount
                frequency = med.doseFrequency
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
