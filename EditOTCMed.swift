import SwiftUI

struct EditOTCMed: View {
    @State var brandName : String  = ""
    @State var medicineName : String  = ""
    @State var doseAmount : Int =  0
    @State var doseFrequency : Int  = 0
    @Binding var Medication : [OTCMed]
    @Binding var med: OTCMed
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ZStack {
            VStack {
                List {
                    DetailTextField(title: "Brand Name", prompt: "Lexapro", boundString: $med.brandName)
                    DetailTextField(title: "Medicine Name", prompt: "Escitalopram", boundString: $med.medName)
                    DetailIntField(title: "Dose Amount (mg)", prompt: "7", boundVar: $med.doseAmount)
                    DetailIntField(title: "Dose Frequency (Hours)", prompt: "24", boundVar: $med.doseFrequency)
                    Button {
                        dismiss()
                        Medication.remove(atOffsets: IndexSet())
                    } label: {
                        Text("Remove")
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
