import SwiftUI

struct ContentView: View {
    @State var prescriptions:  [Prescription] = [Prescription(id: 0, medName: "Escitalopram", brandName: "Lexapro", doseAmount: 7, doseFrequency: 24, hasTaken: false)]
    @State var otcMeds:  [OTCMed] = [OTCMed(id: 0, medName: "Ibuprofen", brandName: "Advil", doseAmount: 10, doseFrequency: 24, timerRunning: false)]
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    VStack {
                        Text("Prescriptions")
                            .underline()
                        
                        List { //Prescription List
                            ForEach($prescriptions) { item in
                                let _name: String = item.medName.wrappedValue
                                let _brand: String = item.brandName.wrappedValue
                                NavigationLink {
                                    EditPrescription(rx: item)
                                } label: {
                                    Text("\(_brand) (\(_name))")
                                }
                            }
                            Text("Add New +")
                        }
                    }
                    
                    VStack {
                        Text("Over-the-Counter Medications")
                            .underline()
                        
                        List { //OTC List
                            ForEach($otcMeds) { item in
                                let _name: String = item.medName.wrappedValue
                                let _brand: String = item.brandName.wrappedValue
                                NavigationLink {
                                    EditOTCMed(med: item)
                                } label: {
                                    Text("\(_brand) (\(_name))")
                                }
                                NavigationLink("Add New +"){
                                    AddOTCMed()
                                }
                            }
                        }
                    }
                    
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
        .navigationViewStyle(.stack)
    }
}
