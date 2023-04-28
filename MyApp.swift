import SwiftUI

@main
struct MyApp: App {
    @State var OTCMed:AddOTCMed = AddOTCMed()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
