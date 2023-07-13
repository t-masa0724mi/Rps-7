import Foundation

class HTTPClient: ObservableObject {
    @Published var computer: [Computer] = []
    
    func load() {
        guard let url = URL(string: "http://52.195.82.85:5000/janken") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return}
            
            DispatchQueue.main.async {
                guard let response = try? JSONDecoder().decode([Computer].self, from: data) else {
                    return print("hoge")
                }
                self.computer = response
            }
        }.resume()
    }
}

