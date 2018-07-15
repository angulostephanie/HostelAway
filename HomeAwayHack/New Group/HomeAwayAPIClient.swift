//
//  HomeAwayAPIClient.swift
//  HomeAwayHack
//
//  Created by Bonnie Nguyen on 7/14/18.
//  Copyright © 2018 Stephanie Angulo. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

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
    
//    public func search(id: String, completion: @escaping (CDYelpBusiness?) -> ()) {
//        if let url = URL(string: "https://ws.homeaway.com/public/search\(id)") {
//            self.manager.request(url).responseObject(completionHandler: { (response: DataResponse<CDYelpBusiness>) in
//                switch response.result {
//                case .success(let searchResponse):
//                    completion(searchResponse)
//                case .failure(let error):
//                    print("ERROR: " + String(describing: error))
//                    completion(nil)
//                }
//            })
//        }
//    }


}
