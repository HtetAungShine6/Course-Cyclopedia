//
//  APIManager.swift
//  Course Cyclopedia
//
//  Created by Akito Daiki on 28/05/2024.
//

import Foundation

protocol APIManager: AnyObject {
    associatedtype ModelType: Codable
    var methodPath: String { get }
}

extension APIManager {
    
    // MARK: - Adding a route to a Default Main Route of an API
    var url: URL {
        let urlString = "https://coursyclopediabackendv2-production.up.railway.app/api" + methodPath
        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL: \(urlString)")
        }
        return url
    }
    
    // MARK: - Execution of API, compatable with all methods
    func execute(data: Codable? = nil, getMethod: String? = nil, token: String? = nil, completion: @escaping(Result<ModelType, Error>) -> Void) {
        
        var request = URLRequest(url: url)
        
        if let method = getMethod {
            request.httpMethod = method
        }
        
        if let data = data {
            do{
                let jsonData = try JSONEncoder().encode(data)
                request.httpBody = jsonData
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            } catch {
                print("Error encoding header: \(error)")
            }
        }
        
        // MARK: - Header
        if let token = token {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            print(httpResponse.statusCode)
            
            if let responseData = data {
                do {
                    let decodeData = try JSONDecoder().decode(ModelType.self, from: responseData)
                    completion(.success(decodeData))
                    print("Successsfull fetched data with valid token.")
                } catch {
                    completion(.failure(error))
                    print("Token Expired.")
                }
            }
        }
        task.resume()
    }
}
