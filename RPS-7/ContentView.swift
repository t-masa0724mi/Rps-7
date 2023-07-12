import SwiftUI

struct ContentView: View {
    
    @State private var isPresented = false
    
    var rps: [Rps] = rpsData
    
    var body: some View {
        VStack {
            HStack {
                Text("コンピューター")
                Spacer()
            }
            Spacer()
    
            Text("じゃーんけーん・・・")
            
            Spacer()
            
            VStack {
                HStack {
                    ForEach(rps[0...2]) { item in
                        RpsButtonView(rps: item)
                    }
                }
                
                HStack {
                    ForEach(rps[3...6]) { item in
                        RpsButtonView(rps: item)
                    }
                }
                .padding()
            }
            
            HStack {
                Spacer()
                Text("プレイヤー")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
