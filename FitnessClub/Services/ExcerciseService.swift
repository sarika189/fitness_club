
import Foundation
import Combine

protocol ApiServiceProtocol {
    func fetchWorkoutDetails(for muscle: MuscleTypes) -> AnyPublisher<[MuscleDetailModel], Error>
    
}

class ExerciseService:  ApiServiceProtocol{
    private var cancellables = Set<AnyCancellable>()
    private let apiKey = "2doKyhGlCij30D0bSj09qw==muKz6n8u6B89v5PI" // Replace with your actual API key
    
    func fetchWorkoutDetails(for muscle: MuscleTypes) -> AnyPublisher<[MuscleDetailModel], Error> {
        let urlString = "https://api.api-ninjas.com/v1/exercises?muscle=\(muscle.rawValue)"
        print(urlString)
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")
        print(request)
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [MuscleDetailModel].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}


//protocol ExerciseService {
//  func fetchExercise(for muscle: MuscleTypes) -> AnyPublisher<[MuscleDetailModel], Error>
//}
//
//extension APIService: ExerciseService {
//
//  func fetchExercise(for muscle: MuscleTypes) -> AnyPublisher<[MuscleDetailModel], Error> {
//
//    return Future { promise in
//
//        self.sendRequest(endpoint: "https://api.api-ninjas.com/v1/exercises?muscle=biceps", method: .get, parameters: muscle.rawValue, headers: ["X-Api-Key": "2doKyhGlCij30D0bSj09qw==muKz6n8u6B89v5PI"], decodingType: [MuscleDetailModel].self) { result in
//        switch result {
//        case .success(let list):
//          promise(.success(list))
//        case .failure(let error):
//          promise(.failure(error))
//        }
//      }
//    }
//    .receive(on: DispatchQueue.main)
//    .eraseToAnyPublisher()
//  }
//
//
//}
