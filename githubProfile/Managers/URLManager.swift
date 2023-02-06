//
//  URLManager.swift
//  githubProfile
//
//  Created by Burak Köse on 6.02.2023.
//

import Foundation

protocol Endpoint {
    var baseUrl: String {get}
    var path: String {get}
}

extension Endpoint {
    var url: String {
        return baseUrl + path
    }
}

enum EndpointCases: Endpoint {
    
    case getUser(username:String)
    case getFollowers(username:String)
    case getFollowing(username:String)
    
    var baseUrl: String {
        switch self {
        case .getUser(let username):
            return "https://api.github.com/users/\(username)"
        case .getFollowers(let username):
            return "https://api.github.com/users/\(username)"
        case .getFollowing(let username):
            return "https://api.github.com/users/\(username)"
        }
    }
    
    var path: String {
        switch self {
        case .getUser:
            return ""
        case .getFollowers:
            return "/followers"
        case .getFollowing:
            return "/following"
        }
    }
    
    
}
