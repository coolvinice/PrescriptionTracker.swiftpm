import SwiftUI

struct TimerView: View {
    @State var nowDate: Date = Date()
    @State var endDate: Date
    @State var referenceDate: Date
    
    var body: some View {
        Text(countDownString(from: referenceDate, until: endDate) + " until next dose")
            .font(
                .body
                .weight(.light)

            )
    }
    
    func countDownString(from date: Date, until nowDate: Date) -> String {
        let components = Calendar(identifier: .gregorian).dateComponents([.hour, .minute, .second], from: nowDate, to: date)
        return String(format: "%02d:%02d:%02d",
                      components.hour ?? 00,
                      components.minute ?? 00,
                      components.second ?? 00)
    }
}
