import SwiftUI

struct ContentView: View{
    @State var tempArray:  [Medicine] = []
    var body: some View {
        VStack {  //Presctiption List
            MainView(tempArray: $tempArray)
            List {
                ForEach(tempArray, id: \.self) { item in
                    Prescribed(item: item)
                }
            }
        }
        
        
        VStack {  //OTC List
            List {
                ForEach(tempArray, id: \.self) { item in
                    Text("Add +")
                    
                }
            }
        }
    }
}
