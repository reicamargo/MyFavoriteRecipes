//
//  NetworkManager.swift
//  MyFavoriteRecipes
//
//  Created by Reinaldo Camargo on 06/06/24.
//

import SwiftUI

final class Network {
    static let shared = Network()
    
    private let baseAPI: String
    private let decoder: JSONDecoder
    private let cache: NSCache<NSString, UIImage>
    
    private init() {
        baseAPI = "https://api.jsonbin.io/v3/b/666238ccad19ca34f8755032"
        decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        cache = NSCache<NSString, UIImage>()
    }
    
    func getRecipes() async throws -> [Recipe] {
        guard let apiURL = URL(string: baseAPI) else { throw NetworkError.badURL(message: "Unable to create URL from baseAPI") }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: apiURL)
            
            return try decoder.decode(RecipeResponse.self, from: data).record.recipes
            
        } catch DecodingError.keyNotFound(let key, let context) {
            throw NetworkError.unableToDecode(message: "Failed to decode due to missing \(key.stringValue) - \(context.debugDescription)")
            //fatalError("Failed to decode due to missing \(key.stringValue) - \(context.debugDescription)")
            
        } catch DecodingError.typeMismatch(_, let context) {
            throw NetworkError.unableToDecode(message:"Failed to decode due to type mismatch - \(context.debugDescription)")
            
        } catch DecodingError.valueNotFound(let type, let context) {
            throw NetworkError.unableToDecode(message:"Failed to decode due to missing \(type) value - \(context.debugDescription)")
            
        } catch DecodingError.dataCorrupted(_) {
            throw NetworkError.unableToDecode(message:"Failed to decode because it appears to be invalid JSON.")
            
        } catch {
            throw NetworkError.unableToDecode(message:"Failed to decode: \(error.localizedDescription)")
        }
    }
    
    func downloadImage(fromURLString urlString: String) async -> UIImage? {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            return image
        }
        
        guard let urlImage = URL(string: urlString) else { return nil }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: urlImage)
            
            guard let image = UIImage(data: data) else { return nil }
            cache.setObject(image, forKey: cacheKey)
            
            return image
            
        } catch {
            return nil
        }
    }
}

enum NetworkError: Error {
    case badURL(message: String)
    case unableToDecode(message: String)
    
    var description: String {
        switch self {
        case .badURL(let message):
            return message
        case .unableToDecode(let message):
            return message
        }
    }
}
