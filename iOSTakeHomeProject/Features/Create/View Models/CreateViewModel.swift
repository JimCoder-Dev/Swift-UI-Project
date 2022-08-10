import Foundation

final class CreateViewModel: ObservableObject{
    
    @Published var person = NewPerson()
    @Published private(set) var state: SubmissionState?
    
    
    func create(){
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        let data = try? encoder.encode(person)
        
        NetworkingManager.shared.request(methodType: .POST(data: data), "https://reqres.in/api/users") { [weak self] res in
            DispatchQueue.main.async {
                switch res{
                case .success:
                    self?.state = .successful
                    break
                case .failure(let err):
                    self?.state = .unsucessful
                    break
                }
            }
        }
    }
}

extension CreateViewModel{
    enum SubmissionState{
        case unsucessful
        case successful
    }
}
