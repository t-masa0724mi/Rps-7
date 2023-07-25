import SwiftUI

struct ResultView: View {
    
    @State private var isPresented = false
    @State private var isAnimationImage = false
    @EnvironmentObject var httpClient: HTTPClient

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
    @EnvironmentObject var httpClient: HTTPClient
    
    var body: some View {
        
        if rps.title == "グー" && httpClient.computer?.hand == 2 || rps.title == "グー" && httpClient.computer?.hand == 6 || rps.title == "グー" && httpClient.computer?.hand == 7 {
            Image("win")
                .resizable()
                .scaledToFit()
        } else if rps.title == "グー" && httpClient.computer?.hand == 3 || rps.title == "グー" && httpClient.computer?.hand == 4 || rps.title == "グー" && httpClient.computer?.hand == 5 {
            Image("lose")
                .resizable()
                .scaledToFit()
        } else if rps.title == "グー" && httpClient.computer?.hand == 1 {
            Image("draw")
                .resizable()
                .scaledToFit()
        } else {
            Image("retry")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()
            Text("もう一回")
        }
            
        if rps.title == "チョキ" && httpClient.computer?.hand == 3 || rps.title == "チョキ" && httpClient.computer?.hand == 5 || rps.title == "チョキ" && httpClient.computer?.hand == 6 {
            Image("win")
                .resizable()
                .scaledToFit()
        } else if rps.title == "チョキ" && httpClient.computer?.hand == 1 || rps.title == "チョキ" && httpClient.computer?.hand == 4 || rps.title == "チョキ" && httpClient.computer?.hand == 7 {
            Image("lose")
                .resizable()
                .scaledToFit()
        } else if rps.title == "チョキ" && httpClient.computer?.hand == 2 {
            Image("draw")
                .resizable()
                .scaledToFit()
        }
        
        if rps.title == "パー" && httpClient.computer?.hand == 1 || rps.title == "パー" && httpClient.computer?.hand == 4 || rps.title == "パー" && httpClient.computer?.hand == 5 {
            Image("win")
                .resizable()
                .scaledToFit()
        } else if rps.title == "パー" && httpClient.computer?.hand == 2 || rps.title == "パー" && httpClient.computer?.hand == 6 || rps.title == "パー" && httpClient.computer?.hand == 7 {
            Image("lose")
                .resizable()
                .scaledToFit()
        } else if rps.title == "パー" && httpClient.computer?.hand == 3 {
            Image("draw")
                .resizable()
                .scaledToFit()
        }
        
        if rps.title == "ウォーター" && httpClient.computer?.hand == 1 || rps.title == "ウォーター" && httpClient.computer?.hand == 2 || rps.title == "ウォーター" && httpClient.computer?.hand == 7 {
            Image("win")
                .resizable()
                .scaledToFit()
        } else if rps.title == "ウォーター" && httpClient.computer?.hand == 3 || rps.title == "ウォーター" && httpClient.computer?.hand == 5 || rps.title == "ウォーター" && httpClient.computer?.hand == 6 {
            Image("lose")
                .resizable()
                .scaledToFit()
        } else if rps.title == "ウォーター" && httpClient.computer?.hand == 4 {
            Image("draw")
                .resizable()
                .scaledToFit()
        }
        
        if rps.title == "エアー" && httpClient.computer?.hand == 1 || rps.title == "エアー" && httpClient.computer?.hand == 4 || rps.title == "エアー" && httpClient.computer?.hand == 7 {
            Image("win")
                .resizable()
                .scaledToFit()
        } else if rps.title == "エアー" && httpClient.computer?.hand == 2 || rps.title == "エアー" && httpClient.computer?.hand == 3 || rps.title == "エアー" && httpClient.computer?.hand == 6 {
            Image("lose")
                .resizable()
                .scaledToFit()
        } else if rps.title == "エアー" && httpClient.computer?.hand == 5 {
            Image("draw")
                .resizable()
                .scaledToFit()
        }
        
        if rps.title == "スポンジ" && httpClient.computer?.hand == 3 || rps.title == "スポンジ" && httpClient.computer?.hand == 4 || rps.title == "スポンジ" && httpClient.computer?.hand == 5 {
            Image("win")
                .resizable()
                .scaledToFit()
        } else if rps.title == "スポンジ" && httpClient.computer?.hand == 1 || rps.title == "スポンジ" && httpClient.computer?.hand == 2 || rps.title == "スポンジ" && httpClient.computer?.hand == 7 {
            Image("lose")
                .resizable()
                .scaledToFit()
        } else if rps.title == "スポンジ" && httpClient.computer?.hand == 6 {
            Image("draw")
                .resizable()
                .scaledToFit()
        }
        
        if rps.title == "ファイヤー" && httpClient.computer?.hand == 2 || rps.title == "ファイヤー" && httpClient.computer?.hand == 3 || rps.title == "ファイヤー" && httpClient.computer?.hand == 6 {
            Image("win")
                .resizable()
                .scaledToFit()
        } else if rps.title == "ファイヤー" && httpClient.computer?.hand == 1 || rps.title == "ファイヤー" && httpClient.computer?.hand == 4 || rps.title == "ファイヤー" && httpClient.computer?.hand == 5 {
            Image("lose")
                .resizable()
                .scaledToFit()
        } else if rps.title == "ファイヤー" && httpClient.computer?.hand == 7 {
            Image("draw")
                .resizable()
                .scaledToFit()
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(rps: rpsData[1])
            .environmentObject(HTTPClient())
    }
}
