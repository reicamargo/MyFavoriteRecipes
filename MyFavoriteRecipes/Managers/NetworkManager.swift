//
//  NetworkManager.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 06/06/24.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    private let baseAPI: String
    private let decoder: JSONDecoder
    
    private init() { 
        baseAPI = "https://api.jsonbin.io/v3/b/666238ccad19ca34f8755032"
        decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func getRecipes() async -> [Recipe] {
        guard let apiURL = URL(string: baseAPI) else { fatalError("Unable to create URL from baseAPI") }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: apiURL)
            
            return try decoder.decode(RecipeResponse.self, from: data).record.recipes
            
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode due to missing \(key.stringValue) - \(context.debugDescription)")
            
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode due to type mismatch - \(context.debugDescription)")
            
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode due to missing \(type) value - \(context.debugDescription)")
            
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode because it appears to be invalid JSON.")
            
        } catch {
            fatalError("Failed to decode: \(error.localizedDescription)")
        }
    }
}

enum NetworkError: String, Error {
    case badURL = "Unable to create URL from baseAPI"
    case unableToDecode = "Unable to decode"
}
