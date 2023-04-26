import SwiftUI

struct ContentView: View {
    @State var tempArray:  [String] = ["Medcine 1", "Medicine 2"]
    var body: some View {
        ZStack {
            VStack {
                VStack {  //Presctiption List
                    List {
                        ForEach(tempArray, id: \.self) { item in
                            Text(item)
                        }
                        Text("Add New +")
                    }
                }
                
                VStack {  //OTC List
                    List {
                        ForEach(tempArray, id: \.self) { item in
                            Text(item)
                        }
                        Text("Add New +")
                    }
                }
            }
            
            VStack {
                Rectangle()
                    .frame(width: .infinity, height: 70)
                    .foregroundColor(.indigo)

                Spacer()
                Rectangle()
                    .frame(width: .infinity, height: 100)
                    .foregroundColor(.indigo)
            }
            .ignoresSafeArea()
            .frame(width: .infinity, height: .infinity)
        }
    }
}
