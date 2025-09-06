//
//  RecentlyViewedHomesView.swift
//  AirbnbClone
//
//  Created by Divakar T R on 06/09/25.
//

import SwiftUI

struct RecentlyViewedHomesView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(Theme.textPrimary)
                }
                
                Spacer()
                
                Button("Edit") {
                }
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(Theme.textPrimary)
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
            
            HStack {
                Text("Recently viewed homes")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(Theme.textPrimary)
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("Today")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(Theme.textPrimary)
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        
                        ForEach(MockData.todayViewed) { property in
                            RecentPropertyCard(property: property)
                                .padding(.horizontal, 20)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("Tuesday 2 September")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(Theme.textPrimary)
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        
                        LazyVGrid(columns: [
                            GridItem(.flexible(), spacing: 12),
                            GridItem(.flexible(), spacing: 12)
                        ], spacing: 16) {
                            ForEach(MockData.previousDayViewed) { property in
                                RecentPropertyCard(property: property, isGridLayout: true)
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                }
                .padding(.top, 20)
                .padding(.bottom, 100)
            }
        }
        .navigationBarHidden(true)
        .background(Theme.background)
    }
}

struct RecentPropertyCard: View {
    let property: RecentlyViewedProperty
    var isGridLayout: Bool = false
    @State private var isLiked: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Image with heart button
            ZStack(alignment: .topTrailing) {
                AsyncImage(url: URL(string: property.imageURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Rectangle()
                        .fill(Theme.textSecondary.opacity(0.3))
                }
                .frame(height: isGridLayout ? 140 : 180)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                Button {
                    isLiked.toggle()
                } label: {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(isLiked ? Theme.primaryColor : Theme.textLight)
                        .frame(width: 28, height: 28)
                        .background(Theme.textPrimary.opacity(0.3))
                        .clipShape(Circle())
                }
                .padding(8)
            }
            
            // Property Details
            VStack(alignment: .leading, spacing: 4) {
                Text(property.title)
                    .font(.system(size: isGridLayout ? 14 : 16, weight: .medium))
                    .foregroundColor(Theme.textPrimary)
                    .lineLimit(1)
                
                HStack(spacing: 4) {
                    Text(property.details)
                        .font(.system(size: isGridLayout ? 12 : 14))
                        .foregroundColor(Theme.textSecondary)
                    
                    Text("★")
                        .font(.system(size: isGridLayout ? 12 : 14))
                        .foregroundColor(Theme.star)
                    
                    Text(String(format: "%.2f", property.rating))
                        .font(.system(size: isGridLayout ? 12 : 14))
                        .foregroundColor(Theme.textPrimary)
                }
            }
        }
    }
}

#Preview {
    RecentlyViewedHomesView()
}
