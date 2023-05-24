import SwiftUI
import Foundation

struct TimerView: View {
    @State var nextDose: Date
    @State var timeUntilNextDose: String = ""
    
    var body: some View {
        Text(timeUntilNextDose + " until next dose")
            .font(
                .body
                .weight(.bold)
            )
            .onAppear(){
                timeUntilNextDose = TimeUntil(until: nextDose)
            }
    }
    
    func TimeUntil(until referenceDate: Date) -> String {
        let timeInterval = Calendar.current.dateComponents([.hour, .minute], from: Date.now, to: referenceDate)
        return "\(timeInterval.hour ?? 00):\(timeInterval.minute ?? 00)"
    }
}
        
