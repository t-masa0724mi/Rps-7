import SwiftUI

struct RpsButtonView: View {
    
    @State private var isPresented = false
    var rps: Rps
    @State var number = 0
    
    var body: some View {
        Button(action: {
            isPresented = true
        }) {
            Text(rps.title)
                .foregroundColor(Color.black)
        }
        .padding()
        .background(Color.gray.opacity(0.3))
        .frame(width: 90, height: 90)
        .fullScreenCover(isPresented: $isPresented) {
            RpsView(rps: rps)
        }
    }
}

struct RpsButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RpsButtonView(rps: rpsData[0])
    }
}
