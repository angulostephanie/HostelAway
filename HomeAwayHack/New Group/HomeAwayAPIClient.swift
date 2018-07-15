//
//  HomeAwayAPIClient.swift
//  HomeAwayHack
//
//  Created by Bonnie Nguyen on 7/14/18.
//  Copyright © 2018 Stephanie Angulo. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

let imageCache = NSCache<NSString, UIImage>()

public class HomeAwayAPICLient: NSObject {
    static let shared = HomeAwayAPICLient()
    
    private var apiKey: String!
    private lazy var manager: Alamofire.SessionManager = {
        if let apiKey = self.apiKey,
            apiKey != "" {
            var headers = Alamofire.SessionManager.defaultHTTPHeaders
            headers["Authorization"] = "Bearer \(apiKey)"
            let configuration = URLSessionConfiguration.default
            configuration.httpAdditionalHeaders = headers
            return Alamofire.SessionManager(configuration: configuration)
        } else {
            return Alamofire.SessionManager()
        }
    }()
    
    private lazy var getToken: Alamofire.SessionManager = {
        var headers = Alamofire.SessionManager.defaultHTTPHeaders
        headers["Authorization"] = "Basic \("YWM2NWZkMDAtMjRjYy00M2Y5LTgzMTgtYzI0NmZjMDM0NmFjOjlmNzdkZTAyLTc5NGUtNGVlNy05MTZhLWNjNWMwMzc5NzE5Nw==")"
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = headers
        return Alamofire.SessionManager(configuration: configuration)
    }()

    public override init() {
        super.init()
        
        if let url = URL(string: "https://ws.homeaway.com/oauth/token") {
            self.getToken.request(url, method: .post).responseObject(completionHandler: { (response: DataResponse<Token>) in
                switch response.result {
                case .success(let searchResponse):
                    self.apiKey = searchResponse.access_token
                case .failure(let error):
                    print("ERROR: " + String(describing: error))
                    return
                }
            })
        }
    }

    public func search(locationTextField: String, numberPeopleTextField: String, maxPriceTextField: String, fromDateTextField: String, toDateTextField: String, completion: @escaping (ListingSearchPaginator?) -> ()) {
        if let url = URL(string: "https://ws.homeaway.com/public/search?q=\(locationTextField)&minSleeps=\(numberPeopleTextField)&maxPrice=\(maxPriceTextField)&availabilityStart=\(fromDateTextField)&availabilityEnd=\(toDateTextField)") {
            self.manager.request(url, method: .get).responseObject(completionHandler: { (response: DataResponse<ListingSearchPaginator>) in
                print(response)
                switch response.result {
                case .success(let searchResponse):
                    print(searchResponse)
                    completion(searchResponse)
                case .failure(let error):
                    print("ERROR: " + String(describing: error))
                    completion(nil)
                }
            })
        }
    }
    
    public func downloadImage(url: URL, completion: @escaping (UIImage?, Error?) -> ()) {
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            completion(cachedImage, nil)
        } else {
            self.getDataFromUrl(url: url, completion: { (data, response, error) in
                guard
                    let data = data,
                    let image = UIImage(data: data),
                    error == nil
                    else {
                        return
                }
                imageCache.setObject(image, forKey: url.absoluteString as NSString)
                completion(image, nil)
            })
        }
    }
    
    public func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }
}
