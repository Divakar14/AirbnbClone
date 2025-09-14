//
//  Alert.swift
//  AirbnbClone
//
//  Created by Divakar T R on 14/09/25.
//

import SwiftUI

struct AlertItem: Identifiable {
    
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
    
}

struct AlertContext {
    
    // MARK: - Account Alerts
    
    static let invalidForm = AlertItem(
        title: Text("Invalid Form"),
        message: Text("Please ensure all fields in the form have been filled out."),
        dismissButton: .default(Text("OK"))
    )
    
    static let invalidEmail = AlertItem(
        title: Text("Invalid Email"),
        message: Text("Please ensure your email is correct."),
        dismissButton: .default(Text("OK"))
    )
    
    static let userSaveSuccess = AlertItem(
        title: Text("Profile Saved"),
        message: Text("Your profile information was successfully saved."),
        dismissButton: .default(Text("OK"))
    )
    
    static let invalidUserData = AlertItem(
        title: Text("Profile Error"),
        message: Text("There was an error saving or retrieving your profile."),
        dismissButton: .default(Text("OK"))
    )
    
}
