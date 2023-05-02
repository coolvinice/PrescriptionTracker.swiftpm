import SwiftUI

struct OTCMed: Identifiable, Codable {
    var id: Int
    var medName: String //Ibuprofen
    var brandName: String //Advil
    var doseAmount: Int //mg
    var doseFrequency: Int //hours
    var timerRunning: Bool //tracks if the dose timer is running
}

struct MyView: View {
    @State var id: Int = 0
    @State var medName: String = ""
    @State var brandName: String = ""
    @State var doseAmount: Int = 0
    @State var doseFrequency: Int = 0
    @State var timerRunning: Bool = false
    @Binding var otcMeds: [OTCMed]
    var body: some View {
        Button {
            let variable = 0
            var encodedList: [Data] = []
            if let encoded = try? JSONEncoder().encode(variable) {
                encodedList.append(encoded)
            }
            
            if let encoded = try? JSONEncoder().encode(variable) {
                encodedList.append(encoded)
            }

            if let data = UserDefaults.standard.object(forKey: "OTCMeds") as? Data {
                if let loadedMed = try? JSONDecoder().decode(OTCMed.self, from: data) {
                    id = encodedList.count
                    medName = loadedMed.medName
                    brandName = loadedMed.brandName
                    doseAmount =  loadedMed.doseAmount
                    doseFrequency = loadedMed.doseFrequency
                    timerRunning = loadedMed.timerRunning
                    
                }
            }
        } label: {
            
        }

    }
}

