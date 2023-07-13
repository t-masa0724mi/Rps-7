import SwiftUI

struct RpsView: View {
    
    @State private var isPresented = false
    
    @ObservedObject var httpClient = HTTPClient()
    
    var rps: Rps
    
    var body: some View {
        VStack {
            HStack {
                Text("コンピューター")
                Spacer()
            }
            .padding()
            
            ComputerHand(computer: computerData[1])
                     
            Text("ぽん!!")
                .font(.largeTitle)
            
            Image(rps.image)
                .resizable()
                .scaledToFit()
            
            HStack {
                Spacer()
                Text("プレイヤー")
            }
            .padding()
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                isPresented = true
            }
            httpClient.load()
        }
        .fullScreenCover(isPresented: $isPresented) {
            ResultView(rps: rps)
        }
    }
}


struct ComputerHand: View {
    var computer: Computer
    
    var body: some View {
        
        if computer.hand == 1 {
            Image("rock")
                .resizable()
                .scaledToFit()
        } else if computer.hand == 2 {
            Image("scissors")
                .resizable()
                .scaledToFit()
        } else if computer.hand == 3 {
            Image("scissors")
                .resizable()
                .scaledToFit()
        } else if computer.hand == 4 {
            Image("water")
                .resizable()
                .scaledToFit()
        } else if computer.hand == 5 {
            Image("air")
                .resizable()
                .scaledToFit()
        } else if computer.hand == 6 {
            Image("sponge")
                .resizable()
                .scaledToFit()
        } else if computer.hand == 7 {
            Image("fire")
                .resizable()
                .scaledToFit()
        } else {
            Image("rock")
                .resizable()
                .scaledToFit()
        }
  
    }
}

struct RspView_Previews: PreviewProvider {
    static var previews: some View {
        RpsView( rps: rpsData[0])
    }
}
