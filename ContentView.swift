import SwiftUI

struct ContentView: View {
    @State var prescriptions: [Prescription] = SaveLoad().loadArrays().0
    @State var otcMeds: [OTCMed] = SaveLoad().loadArrays().1
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Text("Active Medications")
                    
                    List {
                        Section("Prescription") {
                            ForEach($prescriptions) { item in
                                let _name: String = item.medName.wrappedValue
                                let _brand: String = item.brandName.wrappedValue
                                NavigationLink {
                                    EditPrescription(rx: item)
                                } label: {
                                    Text("\(_brand) (\(_name))")
                                }
                            }
                            NavigationLink {
                                AddPrescription(prescriptions: $prescriptions) //CALVIN ADD SAVING
                            } label: {
                                Text("Add New +")
                            }
                        }
                        
                        Section("Over-the-Counter") {
                            ForEach($otcMeds) { item in
                                let _name: String = item.medName.wrappedValue
                                let _brand: String = item.brandName.wrappedValue
                                
                                NavigationLink {
                                    EditOTCMed(med: item)
                                } label: {
                                    Text("\(_brand) (\(_name))")
                                }
                            }
                            NavigationLink {
                                AddOTCMed(otcMeds: $otcMeds, prescriptions: $prescriptions)
                            } label: {
                                Text("Add New +")
                            }
                        }
                    }
                    
                    .listStyle(.sidebar)
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
        .navigationViewStyle(.stack)
    }
}
