//
//  SearchHeaderView.swift
//  AirbnbClone
//
//  Created by Divakar T R on 06/09/25.
//

import SwiftUI

struct SearchHeaderView: View {
    
    @Binding var isSearching: Bool
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        
        HStack {
            Spacer()
            Button(action: {
                isSearching = false
                viewModel.clearSearch()
            }) {
                Image(systemName: "xmark.circle.fill")
                    .font(.title2)
                    .foregroundColor(Theme.textSecondary)
            }
        }
        .padding(.horizontal)
        .padding(.top, 10)
        
    }
    
}
