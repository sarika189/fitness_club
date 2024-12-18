
import Foundation


protocol APIServiceProtocol {
    func sendRequest<T: Decodable, U: Encodable>(
        endpoint: String,
        method: HTTPMethod,
        parameters: U?,
        headers: [String: String]?,
        decodingType: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    )
}

//Base Class for APIService implementation
final class APIService: APIServiceProtocol{
    func sendRequest<T, U>(
        endpoint: String,
        method: HTTPMethod,
        parameters: U?,
        headers: [String : String]?,
        decodingType: T.Type,
        completion: @escaping (Result<T, Error>) -> Void) where T : Decodable, U : Encodable {
        
            guard let url = URL(string: endpoint) else{
                completion(.failure(NetworkError.invalidURL))
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = method.rawValue
            
            if let header = headers {
                header.forEach({ key, value in
                    request.setValue(value, forHTTPHeaderField: key)
                })
            }
            
            if let parameters = parameters{
                do{
                    request.httpBody = try JSONEncoder().encode(parameters)
                    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                } catch{
                    completion(.failure(NetworkError.encodingFailed))
                    return
                }
            }
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else{
                    completion(.failure(NetworkError.noData))
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(decodingType, from: data)
                    completion(.success(result))
                }catch(let error ){
                    print(error)
                    completion(.failure(NetworkError.decodingFailed))
                }
            }
            task.resume()
            
    }
    
    
}

enum NetworkError : Error{
    case invalidURL
    case noData
    case decodingFailed
    case custom(String)
    case encodingFailed
}







enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}
