//
//  BookingConfirmationView.swift
//  AirbnbClone
//
//  Created by Divakar T R on 07/09/25.
//

import SwiftUI

struct BookingConfirmationView: View {
    
        @State private var scale: CGFloat = 0.6
        @State private var opacity: Double = 0.0
        @State private var showCheck = false
        @State private var isClicked = false
        @EnvironmentObject var tabManager: TabManager

        var body: some View {
            ZStack {
                Color(.systemBackground)
                    .ignoresSafeArea()
                VStack(spacing: 24) {
                    ZStack {
                        Circle()
                            .fill(Color.pink.opacity(0.2))
                            .frame(width: 160, height: 160)
                            .scaleEffect(scale)
                            .opacity(opacity)

                        Image(systemName: "checkmark")
                            .font(.system(size: 60, weight: .bold))
                            .foregroundColor(Color.pink)
                            .scaleEffect(showCheck ? 1.0 : 0.1)
                            .opacity(showCheck ? 1.0 : 0)
                    }

                    Text("Booking Confirmed")
                        .font(.title2)
                        .bold()
                    Text("We've emailed your confirmation. Enjoy your trip!")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.secondary)

                    Button(action: {
                        isClicked = true
                    }) {
                        Text("Back to Explore")
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.pink)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    .fullScreenCover(isPresented: $isClicked) {
                        ContentView(showSignInView: .constant(false))
                    }
                }
                .padding()
            }
            .onAppear {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.6)) {
                    showCheck = true
                }
                withAnimation(.easeOut(duration: 0.6).delay(0.05)) {
                    scale = 1.0
                    opacity = 1.0
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                    withAnimation {
                        
                    }
                }
            }
        }
}

#Preview {
    BookingConfirmationView()
}
