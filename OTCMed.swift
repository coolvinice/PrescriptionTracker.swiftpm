import SwiftUI

struct OTCMed: Identifiable, Codable, Equatable {
    var id: Int
    var medName: String //Ibuprofen
    var brandName: String //Advil
    var doseAmount: Int //mg
    var doseFrequency: Int //hours
    var doseFrequency2: Int // minutes
    var timerRunning: Bool //tracks if the dose timer is running
    var lastDose: Date //last time medicine was taken
}
