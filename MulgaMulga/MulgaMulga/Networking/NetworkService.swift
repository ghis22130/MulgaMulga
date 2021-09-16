//
//  NetworkService.swift
//  MulgaMulga
//
//  Created by 지북 on 2021/09/16.
//

import Foundation
import RxSwift
import RxCocoa

protocol NetworkService { }

protocol APIService: NetworkService {
    func request(_ request: Request) -> Observable<Data>
}

protocol NetworkSession {
    var session: URLSession { get }
}

final class DefaultNetworkSession: NetworkSession {
    let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}

extension DefaultNetworkSession: APIService {
    func request(_ request: Request) -> Observable<Data> {
        guard let request = request.urlRequest() else {
            return Observable.error(NetworkError.invalidURL)
        }
        
        return session.rx.data(request: request)
    }
}
