import SwiftUI

@main
struct MyApp: App {
    @State var Medication:OTCMedView = OTCMedView()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
