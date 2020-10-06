//
//  DrinkController.swift
//  Drinks
//
//  Created by jonathan ferrer on 9/24/20.
//

import UIKit

class NetworkController {
    
    let baseURL = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php")!
    
    static let shared = NetworkController()
    
    let cache = NSCache<NSString, UIImage>()
    
    func searchDrink(searchTerm: String, completion: @escaping (Error?, Drinks?) -> Void) {
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let searchQueryItem = URLQueryItem(name: "s", value: searchTerm)
        
        urlComponents?.queryItems = [searchQueryItem]
        
        guard let formattedURL = urlComponents?.url else {
            completion(NSError(), nil)
            return
        }
        
        let request = URLRequest(url: formattedURL)
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("Error searching: \(error)")
                completion(NSError(), nil)
                return
            }
            
            guard let data = data else {
                NSLog("No data has returned from the data task")
                completion(NSError(), nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let drinks = try decoder.decode(Drinks.self, from: data)
                
                completion(nil, drinks)
            } catch {
                NSLog("Error decoding SearchResults from data: \(error)")
                completion(NSError(), nil)
            }
            
            
        }.resume()
        
    }
    
    
}
