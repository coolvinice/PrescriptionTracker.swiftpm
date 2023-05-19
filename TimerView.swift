import SwiftUI

struct TimerView: View {
    @State var nowDate: Date = Date()
    @State var endDate: Date
    @State var referenceDate: Date
    let setDate: Date
    var timer: Timer {
    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
    self.nowDate = Date()
    }
    }
    
    var body: some View {
        Text(TimerFunction(from: referenceDate) + " until next dose")
            .font(
                .body
                .weight(.light)
            )
    }
    
    func TimerFunction(from date: Date) -> String {
    let calendar = Calendar(identifier: .gregorian)
    let timeValue = calendar
    .dateComponents([.day, .hour, .minute, .second], from: nowDate, to: setDate)
    return String(format: "%02d days left - %02d:%02d:%02d",
    timeValue.day!,
    timeValue.hour!,
    timeValue.minute!,
    timeValue.second!)
    }
}
        
