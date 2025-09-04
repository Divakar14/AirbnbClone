//
//  ContentView.swift
//  AirbnbClone
//
//  Created by Divakar T R on 04/09/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ListingViewModel()
    
    var body: some View {
        
        NavigationStack {
            List(viewModel.listings) { listing in
                Text(listing.title)
            }
            .navigationTitle("Airbnb")
        }
        
    }
}

#Preview {
    ContentView()
}
