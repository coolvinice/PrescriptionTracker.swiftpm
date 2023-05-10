import SwiftUI

struct EditPrescription: View {
    @Binding var rx: Prescription
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
                        .disableAutocorrection(true)
                    DetailTextField(title: "Medicine Name", prompt: "Escitalopram", boundString: $name)
                        .disableAutocorrection(true)
                    DetailIntField(title: "Dose Amount (mg)", prompt: "7", boundVar: $amount)
                        .disableAutocorrection(true)
                    DetailIntField(title: "Dose Frequency (Hours)", prompt: "24", boundVar: $frequency)
                        .disableAutocorrection(true)
                    Section {
                        Button {
                            rx.brandName = brand
                            rx.medName = name
                            rx.doseAmount = amount
                            rx.doseFrequency = frequency
                            SaveLoad().saveArrays(rx: rxArray, otc: otcArray)
                            dismiss()
                        } label: {
                            Text("Save")
                        }
                        Button {
                            if let index = rxArray.firstIndex(of: rx){
                                rxArray.remove(at: index)
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
                brand = rx.brandName
                name = rx.medName
                amount = rx.doseAmount
                frequency = rx.doseFrequency
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

struct DetailTextField: View {
    let title: String
    let prompt: String
    @Binding var boundString: String
    var body: some View {
        Section(title) {
            TextField(prompt, text: $boundString)
                .textFieldStyle(.plain)
        }
    }
}

struct DetailIntField: View {
    let title: String
    let prompt: String
    @Binding var boundVar: Int
    var body: some View {
        Section(title) {
            TextField(prompt, value: $boundVar, format: .number)
                .textFieldStyle(.plain)
        }
    }
}
