//
//  Listing.swift
//  AirbnbClone
//
//  Created by Divakar T R on 04/09/25.
//

import Foundation

struct Listing: Identifiable, Codable {
    
    let id: UUID
    let title: String
    let location: String
    let price: Double
    let rating: Double
    let imageUrl: String
    
}
