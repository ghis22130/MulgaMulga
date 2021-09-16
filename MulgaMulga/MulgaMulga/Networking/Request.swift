//
//  Request.swift
//  MulgaMulga
//
//  Created by 지북 on 2021/09/16.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case push = "PUSH"
    case delete = "DELETE"
}

protocol Request {
    var method: HTTPMethod { get }
    var path: String { get }
    
        
}

extension Request {
    var method: HTTPMethod { .get }
    
    func urlRequest() -> URLRequest? {
        guard let url = URL(string: path) else { return nil }
        
        let request = URLRequest(url: url)
        
        return request
    }
}


struct LNRequest: Request {
    let path: String
    
    init(_ endPoint: EndPoint) {
        self.path = endPoint.path()
    }
}
