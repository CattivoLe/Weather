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
