//
//  ReserveView.swift
//  AirbnbClone
//
//  Created by Divakar T R on 07/09/25.
//

import SwiftUI

struct ReserveView: View {
    
    let cardId: UUID
    @State private var propertyDetail: PropertyDetail
    @Environment(\.dismiss) private var dismiss
    @State var isConfirmed: Bool = false
    
    init(cardId: UUID) {
        self.cardId = cardId
        self._propertyDetail = State(initialValue: MockData.getPropertyDetailOrDefault(for: cardId))
    }
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(Theme.textPrimary)
                    }
                    .padding(.leading)
                    Text("Confirm and pay")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(Theme.textPrimary)
                        .padding()
                    Spacer()
                }
                
                HStack {
                    Image("Villa1")
                        .resizable()
                        .frame(width: 150, height: 120)
                        .cornerRadius(10)
                    VStack (alignment: .leading, spacing: 10) {
                        Text(propertyDetail.title)
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(Theme.textPrimary)
                        Text(propertyDetail.description)
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(Theme.textSecondary)
                        HStack {
                            Image(systemName: "star.fill")
                            Text(String(format: "%.2f", propertyDetail.rating))
                            Text("·")
                            Text("\(propertyDetail.currency)\(propertyDetail.pricePerNight) / night")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(Theme.textPrimary)
                        }
                    }
                    
                }
                .padding()
                
                Divider()
                
                HStack {
                    Text("Free Cancellation before \(propertyDetail.checkIn). Get a full refund if you change your mind.")
                    Image(systemName: "calendar")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .padding()
                }
                .padding()
                
                Rectangle()
                    .frame(width: .infinity, height: 8)
                    .opacity(0.1)
                
                HStack {
                    VStack (alignment: .leading, spacing: 15) {
                        Text("Your Trip")
                            .font(.system(size: 24, weight: .medium))
                        VStack (alignment: .leading) {
                            HStack {
                                Text("Dates")
                                    .font(.system(size: 20, weight: .medium))
                                Spacer()
                                Text("Edit")
                                    .font(.system(size: 20, weight: .medium))
                                    .underline()
                            }
                            Text("\(propertyDetail.checkIn) - \(propertyDetail.checkOut)")
                                .font(.system(size: 18, weight: .regular))
                        }
                        VStack (alignment: .leading) {
                            HStack {
                                Text("Guests")
                                    .font(.system(size: 20, weight: .medium))
                                Spacer()
                                Text("Edit")
                                    .font(.system(size: 20, weight: .medium))
                                    .underline()
                            }
                            Text(String(format: "%.2f", propertyDetail.maxGuests))
                                .font(.system(size: 18, weight: .regular))
                        }
                    }
                    Spacer()
                }
                .padding()
                
                Rectangle()
                    .frame(width: .infinity, height: 8)
                    .opacity(0.1)
                
                HStack {
                    VStack (alignment: .leading, spacing: 10) {
                        Text("Your Total")
                            .font(.system(size: 24, weight: .medium))
                        HStack {
                            Text("1 night x \(propertyDetail.pricePerNight)")
                                .font(.system(size: 18, weight: .regular))
                            Spacer()
                            Text("\(propertyDetail.currency)\(propertyDetail.pricePerNight)")
                                .font(.system(size: 18, weight: .regular))
                        }
                        HStack {
                            Text("Taxes")
                                .font(.system(size: 18, weight: .regular))
                            Spacer()
                            Text("\(propertyDetail.currency)254.65")
                                .font(.system(size: 18, weight: .regular))
                        }
                        Divider().padding(.horizontal, 2)
                        HStack {
                            Text("Total (INR)")
                                .font(.system(size: 18, weight: .medium))
                            Spacer()
                            Text("\(propertyDetail.currency)2254.65")
                                .font(.system(size: 18, weight: .medium))
                        }
                        HStack {
                            Spacer()
                            Text("Price breakdown")
                                .font(.system(size: 18, weight: .medium))
                                .underline()
                        }
                    }
                    .padding()
                }
                
                Rectangle()
                    .frame(width: .infinity, height: 8)
                    .opacity(0.1)
                
                HStack {
                    VStack (alignment: .leading, spacing: 5) {
                        Text("Availability")
                            .font(.system(size: 24, weight: .medium))
                        Text("\(propertyDetail.checkIn) - \(propertyDetail.checkOut)")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(Theme.textSecondary)
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(Theme.textPrimary)
                }
                .padding()
                
                Divider()
                
                HStack {
                    VStack (alignment: .leading, spacing: 8) {
                        Text("Cancellation Policy")
                            .font(.system(size: 24, weight: .medium))
                        Text("Free cancellation policy before \(propertyDetail.checkIn). Cancel before check-in on \(propertyDetail.checkIn) for a partail refund.")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(Theme.textSecondary)
                        Text("Review this Host's full policy for details.")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(Theme.textSecondary)
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(Theme.textPrimary)
                }
                .padding()
                
                Divider()
                
                HStack {
                    VStack (alignment: .leading, spacing: 8) {
                        Text("House Rules")
                            .font(.system(size: 24, weight: .medium))
                        VStack(alignment: .leading) {
                            Text("Check-in after 12.00 pm")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(Theme.textSecondary)
                            Text("Check-out before 11.00 am")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(Theme.textSecondary)
                            Text("2 guests maximum")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(Theme.textSecondary)
                        }
                        Text("Show more")
                            .font(.system(size: 20, weight: .medium))
                            .underline()
                    }
                    Spacer()
                }
                .padding()
                
                Divider()
                
                HStack {
                    VStack (alignment: .leading, spacing: 8) {
                        Text("Safety & property")
                            .font(.system(size: 24, weight: .medium))
                        VStack(alignment: .leading) {
                            Text("No somke alarm")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(Theme.textSecondary)
                            Text("Exterior security cameras on property")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(Theme.textSecondary)
                            Text("Carbon monoxide detector not required")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(Theme.textSecondary)
                        }
                        Text("Show more")
                            .font(.system(size: 20, weight: .medium))
                            .underline()
                    }
                    Spacer()
                }
                .padding()
                
                VStack {
                    Divider()
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(propertyDetail.currency)\(propertyDetail.pricePerNight) night")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(Theme.textPrimary)
                            HStack {
                                Text("⭐️ \(String(format: "%.2f", propertyDetail.rating))")
                                    .font(.caption)
                                    .foregroundColor(Theme.textSecondary)
                                Text("·")
                                    .foregroundColor(Theme.textSecondary)
                                Text("\(propertyDetail.checkIn) - \(propertyDetail.checkOut)")
                                    .font(.caption)
                                    .foregroundColor(Theme.textSecondary)
                            }
                        }
                        Spacer()
                        Button(action: {
                            isConfirmed = true
                        }) {
                            Text("Reserve")
                                .fontWeight(.bold)
                                .foregroundColor(Theme.textLight)
                                .padding()
                                .frame(width: 180)
                                .background(Theme.primaryColor)
                                .cornerRadius(12)
                        }
                        .fullScreenCover(isPresented: $isConfirmed) {
                            BookingConfirmationView()
                        }
                        
                    }
                    .padding()
                    .background(Theme.background)
                }
                
            }
        }
        
    }
}

#Preview {
    ReserveView(cardId: UUID())
}
