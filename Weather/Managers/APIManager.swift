//
//  APIManager.swift
//  Weather
//
//  Created by Alexander Omelchuk on 24/02/2019.
//  Copyright © 2019 Александр Омельчук. All rights reserved.
//

import Foundation

typealias JSONTask = URLSessionDataTask
typealias JSONCompletionHandler = ([String:AnyObject]?, HTTPURLResponse?, Error?) -> Void

enum APIResult<Type> {
    case Success(Type)
    case Failure(Error)
}

protocol APIManager {
    
    var sessionConfiguration: URLSessionConfiguration { get }
    var session: URLSession { get }
    
    func JSONTaskWith (request: URLRequest, completionHandler: JSONCompletionHandler) -> JSONTask
    func fetch<Type> (request: URLRequest, parse: ([String:AnyObject]) -> Type?, completionHandler: (APIResult<Type>) -> Void )
    
    init (sessionConfiguration: URLSessionConfiguration)
}

extension APIManager {
    
    func JSONTaskWith (request: URLRequest, completionHandler: @escaping JSONCompletionHandler) -> JSONTask {
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            guard let HTTPResponse = response as? HTTPURLResponse else {
                
                let userInfo = [NSLocalizedDescriptionKey: NSLocalizedString("Missing HTTP Response", comment: "MissingHTTP")]
                let error = NSError(domain: WETNetworkingErrorDomain, code: 100, userInfo: userInfo)
                
                completionHandler(nil, nil, error)
                return
            }
            
            if data == nil {
                if let error = error {
                    completionHandler(nil, HTTPResponse, error)
                }
            } else {
                switch HTTPResponse.statusCode {
                case 200:
                    do {
                        let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:AnyObject]
                        completionHandler(json, HTTPResponse, nil)
                    } catch let error as NSError {
                        completionHandler(nil, HTTPResponse, error)
                    }
                default: print("We have got response status \(HTTPResponse.statusCode)")
                }
            }
        }
        return dataTask
    }
    
    func fetch<Type> (request: URLRequest, parse: ([String:AnyObject]) -> Type?, completionHandler: (APIResult<Type>) -> Void ) {
        
    }
    
    
}

//
//        let baseURL = URL(string: "https://api.darksky.net/forecast/ea099f6f7a72186c1bea538c8e1ee5de/")
//        let fullURL = URL(string: "37.8267,-122.4233", relativeTo: baseURL)
//
//        let sessionConfiguration = URLSessionConfiguration.default
//        let session = URLSession(configuration: sessionConfiguration)
//
//        let request = URLRequest(url: fullURL!)
//        let dataTask = session.dataTask(with: fullURL!) { (data, response, error) in
//            print(data)
//        }
//        dataTask.resume()
//
