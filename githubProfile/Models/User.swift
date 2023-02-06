//
//  User.swift
//  githubProfile
//
//  Created by Burak Köse on 6.02.2023.
//

import Foundation

struct User:Codable {
    var login:        String?
    var avatarUrl:   String?
    var htmlUrl:     String?
    var name:         String?
    var company:      String?
    var location:     String?
    var bio:          String?
    var publicRepos: Int?
    var followers:    Int?
    var following:    Int?
    var createdAt:   String?
}

