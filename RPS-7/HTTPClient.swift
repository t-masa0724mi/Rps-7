import Foundation

class HTTPClient: ObservableObject {
    @Published var computer: Computer?
    
    func load() {
        let jankenUrl = "http://52.195.82.85:5000/janken"
        guard let url = URL(string: jankenUrl) else { return }
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            guard let response = try? decoder.decode(Computer.self, from: data) else { return }
            DispatchQueue.main.async {
                self.computer = response
            }
        }
        task.resume()
    }
}

