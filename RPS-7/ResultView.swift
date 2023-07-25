import SwiftUI

struct ResultView: View {
    
    @State private var isPresented = false
    @State private var isAnimationImage = false
    @ObservedObject var httpClient = HTTPClient()
    var rps: Rps
    
    var body: some View {
        VStack {
            HStack {
                Text("コンピューター")
                    .padding()
                Spacer()
            }
            Spacer()
            
            ResultImage(rps: rps, computer: Computer(hand: httpClient.computer?.hand ?? 0))
                .scaleEffect(isAnimationImage ? 1.0 : 0.6)
            
            Spacer()
            
            Image(rps.image)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            Spacer()
            
            HStack {
                Spacer()
                Text("プレイヤー")
                    .padding()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                isPresented = true
            }
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimationImage = true
            }
        }
        .fullScreenCover(isPresented: $isPresented) {
            ContentView()
        }
    }
}

struct ResultImage: View {
    var rps: Rps
    var computer: Computer
    @ObservedObject var httpClient = HTTPClient()
    
    var body: some View {
        if rps.title == "グー" && httpClient.computer?.hand == 2 || httpClient.computer?.hand == 6 || httpClient.computer?.hand == 7 {
            Image("win")
                .resizable()
                .scaledToFit()
        } else if rps.title == "グー" && httpClient.computer?.hand == 3 || httpClient.computer?.hand == 4 || httpClient.computer?.hand == 5 {
            Image("lose")
                .resizable()
                .scaledToFit()
        } else {
            Image("draw")
                .resizable()
                .scaledToFit()
        }
            
        if rps.title == "チョキ" && httpClient.computer?.hand == 3 || httpClient.computer?.hand == 5 || httpClient.computer?.hand == 6 {
            Image("win")
                .resizable()
                .scaledToFit()
        } else if rps.title == "チョキ" && httpClient.computer?.hand == 1 || httpClient.computer?.hand == 4 || httpClient.computer?.hand == 7 {
            Image("lose")
                .resizable()
                .scaledToFit()
        }
        
        if rps.title == "パー" && httpClient.computer?.hand == 1 || httpClient.computer?.hand == 4 || httpClient.computer?.hand == 5 {
            Image("win")
                .resizable()
                .scaledToFit()
        } else if rps.title == "パー" && httpClient.computer?.hand == 2 || httpClient.computer?.hand == 6 || httpClient.computer?.hand == 7 {
            Image("lose")
                .resizable()
                .scaledToFit()
        }
        
        if rps.title == "ウォーター" && httpClient.computer?.hand == 1 || httpClient.computer?.hand == 2 || httpClient.computer?.hand == 7 {
            Image("win")
                .resizable()
                .scaledToFit()
        } else if rps.title == "ウォーター" && httpClient.computer?.hand == 3 || httpClient.computer?.hand == 5 || httpClient.computer?.hand == 6 {
            Image("lose")
                .resizable()
                .scaledToFit()
        }
        
        if rps.title == "エアー" && httpClient.computer?.hand == 1 || httpClient.computer?.hand == 4 || httpClient.computer?.hand == 7 {
            Image("win")
                .resizable()
                .scaledToFit()
        } else if rps.title == "エアー" && httpClient.computer?.hand == 2 || httpClient.computer?.hand == 3 || httpClient.computer?.hand == 6 {
            Image("lose")
                .resizable()
                .scaledToFit()
        }
        
        if rps.title == "スポンジ" && httpClient.computer?.hand == 3 || httpClient.computer?.hand == 4 || httpClient.computer?.hand == 5 {
            Image("win")
                .resizable()
                .scaledToFit()
        } else if rps.title == "スポンジ" && httpClient.computer?.hand == 1 || httpClient.computer?.hand == 2 || httpClient.computer?.hand == 7 {
            Image("lose")
                .resizable()
                .scaledToFit()
        }
        
        if rps.title == "ファイヤー" && httpClient.computer?.hand == 2 || httpClient.computer?.hand == 3 || httpClient.computer?.hand == 6 {
            Image("win")
                .resizable()
                .scaledToFit()
        } else if rps.title == "ファイヤー" && httpClient.computer?.hand == 1 || httpClient.computer?.hand == 4 || httpClient.computer?.hand == 5 {
            Image("lose")
                .resizable()
                .scaledToFit()
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(rps: rpsData[1])
    }
}
