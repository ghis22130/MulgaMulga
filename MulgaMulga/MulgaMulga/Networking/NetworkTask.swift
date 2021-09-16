//
//  NetworkTask.swift
//  MulgaMulga
//
//  Created by 지북 on 2021/09/16.
//

import Foundation
import RxSwift

protocol NetworkTask {
    associatedtype Input: Request
    
    associatedtype Output
}

protocol APITask: NetworkTask {
    var service: APIService { get }
    
    func perform(_ request: Input) -> Observable<Output>
}

extension APITask where Output: Decodable {
    
    func perform(_ request: Input) -> Observable<Output> {
        return service.request(request).flatMap { decode($0) }
    }
    
    private func decode(_ data: Data) -> Observable<Output> {
        return Observable.create { observar in
            do {
                let output = try JSONDecoder().decode(Output.self, from: data)
                observar.onNext(output)
            } catch {
                observar.onError(error)
            }
            return Disposables.create()
        }
    }
}

struct LNListTask: APITask {
    
    typealias Input = LNRequest
    typealias Output = LNResponse
    
    let service: APIService
    
    init(_ service: APIService) {
        self.service = service
    }
}
