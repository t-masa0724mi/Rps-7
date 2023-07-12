import SwiftUI

struct ResultView: View {
    
    @State private var isPresented = false
    var rps: Rps
    
    var body: some View {
        VStack {
            HStack {
                Text("コンピューター")
                    .padding()
                Spacer()
            }
            Spacer()
            
            Image("win")
                .resizable()
                .scaledToFit()
            
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
        }
        .fullScreenCover(isPresented: $isPresented) {
            ContentView()
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(rps: rpsData[1])
    }
}
