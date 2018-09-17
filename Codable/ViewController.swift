import UIKit

struct GitUser: Codable {
    var id: Int
    var name: String?
    var company: String?
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataFromRemote()
    }
    
    func fetchDataFromRemote() {
        let jsonString = "https://api.github.com/users/marcinkarski"
        guard let url = URL(string: jsonString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(GitUser.self, from: data)
                print(user)
            } catch let jsonError {
                print("Error", jsonError)
            }
        }.resume()
    }
}
