//
//  APIModule.swift
//  Random
//
//  Created by Víctor Vicente on 20/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation
import Moya
import RxSwift

public enum APIModule {
    case get(results: Int)
}

extension APIModule {
    
    static func getProvider(baseurl: String) -> MoyaProvider<APIModule> {
        
        let apiProvider = MoyaProvider<APIModule>(endpointClosure: {(target: APIModule) -> Moya.Endpoint in
            
            let base = URL(string: "http://api.randomuser.me")
            
            let url = base?.appendingPathComponent(target.path).absoluteString
			let endpoint: Moya.Endpoint = Endpoint(url: url!, sampleResponseClosure: { .networkResponse(200, target.sampleData) }, method: target.method, task: target.task, httpHeaderFields: target.headers)
            
            return endpoint
        })
        
        return apiProvider
    }
}

extension APIModule: Moya.TargetType {
	
    public var baseURL: URL {
        return URL(string: "https://not.in.use/")!
    }
    
    public var path: String {
        switch self {
        case .get(results: _):
            return "/"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .get(results: _):
            return .get
        }
    }
    
    public var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    public var task: Task {
        switch self {
        case .get(let results):
			return .requestParameters(parameters: ["results": results], encoding: URLEncoding.queryString)
        }
    }
    
    public var headers: [String : String]? {
        return nil
    }
}
