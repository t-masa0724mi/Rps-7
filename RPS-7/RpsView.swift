import SwiftUI

struct RpsView: View {
    
    @State private var isPresented = false
    var rps: Rps
    
    var body: some View {
        VStack {
            HStack {
                Text("コンピューター")
                Spacer()
            }
            .padding()
            
            Image("rock")
                .resizable()
                .scaledToFit()
            
            Text("ぽん!!")
                .font(.largeTitle)
            
            Image(rps.image)
                .resizable()
                .scaledToFit()
            
            HStack {
                Spacer()
                Text("プレイヤー")
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//                isPresented = true
            }
        }
        .fullScreenCover(isPresented: $isPresented) {
            ResultView(rps: rps)
        }
    }
}

struct RspView_Previews: PreviewProvider {
    static var previews: some View {
        RpsView(rps: rpsData[0])
    }
}
