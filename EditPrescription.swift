import SwiftUI

struct EditPrescription: View {
    @Binding var rx: Prescription
    var body: some View {
        ZStack {
            VStack {
                DetailTextField(title: "Brand Name", prompt: "Lexapro", boundString: $rx.brandName)
                DetailTextField(title: "Medicine Name", prompt: "Escitalopram", boundString: $rx.medName)
                DetailIntField(title: "Dose Amount (mg)", prompt: "7", boundVar: $rx.doseAmount)
                DetailIntField(title: "Dose Frequency (Hours)", prompt: "24", boundVar: $rx.doseFrequency)
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
        HStack {
            Text(title)
            TextField(prompt, text: $boundString)
                .textFieldStyle(.roundedBorder)
        }
        .padding(5)
    }
}

struct DetailIntField: View {
    let title: String
    let prompt: String
    @Binding var boundVar: Int
    var body: some View {
        HStack {
            Text(title)
            TextField(prompt, value: $boundVar, format: .number)
                .textFieldStyle(.roundedBorder)
        }
        .padding(5)
    }
}
