import SwiftUI

struct TimerView: View {
    @State var nowDate: Date = Date()
    @State var endDate: Date
    let referenceDate: Date
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            self.nowDate = Date()
        }
    }
    
    var body: some View {
        Text(countDownString(from: referenceDate, until: endDate))
            .onAppear(perform: {
                let _ = self.timer
            })
    }
    
    func countDownString(from date: Date, until nowDate: Date) -> String {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar
            .dateComponents([.hour, .minute]
                            ,from: nowDate,
                            to: date)
        return String(format: "%02d:%02d",
                      components.hour ?? 00,
                      components.minute ?? 00)
    }
}
