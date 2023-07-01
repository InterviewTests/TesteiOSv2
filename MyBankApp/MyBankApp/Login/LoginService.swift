import Foundation

protocol LoginServiceProtocol {
    func login(user: String, password: String, completion: @escaping (Result<LoginResponse, NetworkError>) -> Void)
}

final class LoginService: LoginServiceProtocol {
    private let networkService: NetworkService
    
    init(networkService: NetworkService = NetworkServiceImpl()) {
        self.networkService = networkService
    }
    
    func login(
        user: String,
        password: String,
        completion: @escaping (Result<LoginResponse, NetworkError>) -> Void
    ) {
        guard let url = URL(string: "https://your-login-api-url.com/login") else {
            completion(.failure(.invalidResponse))
            return
        }
        
        let bodyParameters = ["user": user, "password": password]
        
        networkService.request(
            url: url,
            method: .post,
            bodyParameters: bodyParameters
        ) { (result: Result<LoginResponse, NetworkError>) in
            completion(result)
        }
    }
}

/*
 let loginService = LoginService()

 loginService.login(user: "your-username", password: "your-password") { result in
     switch result {
     case .success(let response):
         // Handle successful login
         print("Logged in with ID:", response.id)
     case .failure(let error):
         // Handle login error
         print("Login error:", error.localizedDescription)
     }
 }
 */
