import SwiftUI

struct OTCMed: Identifiable, Codable, Equatable {
    var id: Int
    var medName: String //Ibuprofen
    var brandName: String //Advil
    var doseAmount: Int //mg
    var doseFrequency: Int //hours
    var timerRunning: Bool //tracks if the dose timer is running
    var lastDose: Date = Date.now //last time medicine was taken
}
