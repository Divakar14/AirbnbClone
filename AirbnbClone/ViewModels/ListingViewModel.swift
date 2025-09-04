//
//  ListingViewModel.swift
//  AirbnbClone
//
//  Created by Divakar T R on 04/09/25.
//

import Foundation

class ListingViewModel: ObservableObject {
    
    @Published var listings: [Listing] = []
    
    init() {
        
        loadListings()
        
    }
    
    private func loadListings() {
        
        self.listings = MockData.listings
        
    }
    
}
