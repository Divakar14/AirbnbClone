//
//  User.swift
//  AirbnbClone
//
//  Created by Divakar T R on 04/09/25.
//

import Foundation

struct User: Identifiable, Codable {
    
    let id: UUID
    let name: String
    let profileImage: String
    
}
