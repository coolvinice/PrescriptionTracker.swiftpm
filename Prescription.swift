struct Prescription: Identifiable, Codable, Equatable {
    var id: Int
    var medName: String //Escitalopram
    var brandName: String //Lexapro
    var doseAmount: Int //mg
    var doseFrequency: Int //hours
    var doseFrequency2: Int // minutes
    var hasTaken: Bool //tracks if you took it today
}
