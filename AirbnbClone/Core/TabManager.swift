//
//  TabManager.swift
//  AirbnbClone
//
//  Created by Divakar T R on 14/09/25.
//

import Foundation

class TabManager: ObservableObject {
    
    enum Tab: Int {
        case explore = 0
        case trips = 1
        case wishlist = 2
        case messages = 3
        case profile = 4
    }
    
    @Published var selectedTab : Tab = .explore
}
