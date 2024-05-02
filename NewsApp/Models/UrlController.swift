//
//  UrlController.swift
//  NewsApp
//
//  Created by Satyam Singh on 02/05/24.
//

import Foundation


class NetworkManager {
    
//    var articles: [Article] = [ ]
    
    static let url = "https://newsapi.org/v2/everything?q=tesla&from=2024-04-02&sortBy=publishedAt&apiKey=13d2b68b5e584b7e9af33ab1d1635e83"
    
    static func getData(completion: @escaping (_ articles: [Article]?, _ error: Error?) -> Void) {
        
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            print(data)
            
            var result: Response?
            
            do {
                result = try JSONDecoder().decode(Response.self, from: data)
                
                completion(result?.articles, nil)
                
            }
            catch {
                print("Failed to convert \(error)")
                completion(nil, error)
            }
            
        }).resume()
    }
    
}
