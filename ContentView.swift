import SwiftUI

struct ContentView: View {
    @State var prescriptions: [Prescription] = SaveLoad().loadArrays().0
    @State var otcMeds: [OTCMed] = SaveLoad().loadArrays().1
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        Section("Prescription") {
                            ForEach($prescriptions) { item in
                                let name: String = item.medName.wrappedValue
                                let brand: String = item.brandName.wrappedValue
                                NavigationLink {
                                    EditPrescription(rx: item, rxArray: $prescriptions, otcArray: $otcMeds)
                                } label: {
                                    Text("\(brand) (\(name))")
                                }
                            }
                            NavigationLink {
                                AddPrescription(otcMeds: $otcMeds, prescriptions: $prescriptions)
                            } label: {
                                Text("Add New +")
                            }
                        }
                        
                        Section("Over-the-Counter") {
                            ForEach($otcMeds) { item in
                                let name: String = item.medName.wrappedValue
                                let brand: String = item.brandName.wrappedValue
                                let amount: Int = item.doseAmount.wrappedValue
                                let frequency: Int = item.doseFrequency.wrappedValue
                                let lastDose: Date = item.lastDose.wrappedValue
                                NavigationLink {
                                    EditOTCMed(med: item, rxArray: $prescriptions, otcArray: $otcMeds)
                                } label: {
                                    OTCListItem(name: name, brand: brand, amount: amount, frequency: frequency, lastDose: lastDose)
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
        .navigationTitle("Active Medications")
    }
}

struct OTCListItem: View {
    let name: String
    let brand: String
    let amount: Int
    let frequency: Int
    let lastDose: Date
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(brand) (\(name))")
                .font(.title2)
            Text(verbatim: "\(amount) mg Every \(frequency == 1 ? "Hour" : "\(frequency) Hours")")
            TimerView(endDate: lastDose.addingTimeInterval(TimeInterval(frequency * 360)), referenceDate: Date.now)
                
        }
        
    }
}
