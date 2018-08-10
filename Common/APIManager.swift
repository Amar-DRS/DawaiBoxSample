//
//  APIManager.swift
//  RESTAPIManager
//
//  Created by Amarjeet Patel on 21/12/2016.
//  Copyright © 2017 Supra ES. All rights reserved.
//

import UIKit
class APIManager: NSObject {
    
    static let sharedInstance = APIManager()
    let utility = Utility()
    
    func getDawaiData(SearchString: String, onSuccess: @escaping(JSON) -> Void, onFailure: @escaping(Error) -> Void){
        let url : String = BaseURL + searchMthod + SearchString
        
        let urlString = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)

        let request: NSMutableURLRequest = NSMutableURLRequest(url: NSURL(string: urlString!)! as URL)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            if(error != nil){
                onFailure(error!)
            } else{
                do {
                    let result = try JSON(data: data!)
                    onSuccess(result)
                    print(result)

                }
                catch {
                   // SVProgressHUD.dismiss()
                    print(error)
                }
            }
        })
        task.resume()
    }
}
