import SwiftUI

struct ContentView: View {
    @State var prescriptions:  [Prescription] = [Prescription(id: 0, medName: "Escitalopram", brandName: "Lexapro", doseAmount: 7, doseFrequency: 24, hasTaken: false)]
    @State var otcMeds:  [OTCMed] = [OTCMed(id: 0, medName: "Ibuprofen", brandName: "Advil", doseAmount: 10, doseFrequency: 24, timerRunning: false)]
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    VStack {  //Presctiption List
                        List {
                            ForEach($prescriptions) { item in
                                NavigationLink {
                                    EditPrescription(rx: item)
                                } label: {
                                    Text("Medicine") //Need to display medicine name somehow "Lexapro (Escitalopram)"
                                }
                            }
                            
                            Text("Add New +")
                        }
                    }
                    
                    VStack {  //OTC List
                        List {
                            ForEach($otcMeds) { item in
                                NavigationLink {
                                    EditOTCMed(med: item)
                                } label: {
                                    Text("Medicine") //Need to display medicine name somehow "Advil (Ibuprofen)"
                                }
                            }
                            Text("Add New +")
                        }
                    }
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
}
