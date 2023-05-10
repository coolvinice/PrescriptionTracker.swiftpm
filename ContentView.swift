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
                                NavigationLink {
                                    EditOTCMed(med: item, rxArray: $prescriptions, otcArray: $otcMeds)
                                } label: {
                                    OTCListItem(name: name, brand: brand, amount: amount, frequency: frequency, timeLeft: 75)
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
    }
}

struct OTCListItem: View {
    let name: String
    let brand: String
    let amount: Int
    let frequency: Int
    @State var timeLeft: Int
    @State var timeString: String = ""
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(brand) (\(name))")
                .font(.title2)
            Text(verbatim: "\(amount) mg Every \(frequency == 1 ? "Hour" : "\(frequency) Hours") - \(timeString) Until Next Dose")
        }
        .onChange(of: timeLeft) { newValue in
            let minutes = newValue % 60
            let hours = newValue / 60
            timeString = "\(hours):\(minutes)"
        }
        .onAppear() {
            let minutes = timeLeft % 60
            let hours = timeLeft / 60
            timeString = "\(String(format: "%02d", hours)):\(String(format: "%02d", minutes))"
        }
        .onChange(of: Date.now) { newValue in
//            timeLeft = Date.now.advanced(by: TimeInterval(frequency)).formatted() as Int
        }
    }
}
