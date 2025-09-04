//
//  MockData.swift
//  AirbnbClone
//
//  Created by Divakar T R on 04/09/25.
//

import Foundation

struct MockData {
    
    static let listings: [Listing] = [
        Listing(id: UUID(), title: "Cozy Beachfront Villa", location: "Malibu, California", price: 350, rating: 4.8, imageUrl: "Villa1"),
        Listing(id: UUID(), title: "Modern Apartment in City Center", location: "New York, USA", price: 200, rating: 4.6, imageUrl: "Apartment1"),
        Listing(id: UUID(), title: "Rustic Cabin in the Woods", location: "Colorado, USA", price: 150, rating: 4.7, imageUrl: "Cabin1")
    ]
    
    static let user: [User] = [
        User(id: UUID(), name: "Divakar", profileImage: "Profile1")
    ]
    
}
