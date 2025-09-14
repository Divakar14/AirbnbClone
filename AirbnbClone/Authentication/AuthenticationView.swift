//
//  AuthenticationView.swift
//  AirbnbClone
//
//  Created by Divakar T R on 07/09/25.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth
import Lottie

struct GoogleSignInResultModel {
    
    let idToken: String
    let accessToken: String
    
}

@MainActor
final class AuthenticationViewModel: ObservableObject {
    
    func signInGoogle() async throws {
        
        guard let topVC = Utilities.shared.topViewController() else {
            throw URLError(.cannotFindHost)
        }
        
        let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
        
        guard let idToken = gidSignInResult.user.idToken?.tokenString else {
            throw URLError(.badServerResponse)
        }
        
        let accessToken = gidSignInResult.user.accessToken.tokenString

        
        let tokens = GoogleSignInResultModel(idToken: idToken, accessToken: accessToken)
        
        try await AuthenticationManager.shared.signInWithGoogle(tokens: tokens)
        
    }
    
}

struct AuthenticationView: View {
    
    @StateObject private var viewModel = AuthenticationViewModel()
    @Binding var showSignInView: Bool

    var body: some View {
        VStack {
            
            VStack {
                
                LottieView(animation: .named("Login"))
                    .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
                
            }
           
            VStack (spacing: 20) {
                
                NavigationLink {
                    SignInEmailView(showSignInView: $showSignInView)
                } label: {
                    HStack {
                        Image(systemName: "envelope")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(Theme.textPrimary)
                            .padding(.leading)
                        Spacer()
                        Text("Continue with Email")
                            .foregroundStyle(.black)
                        Spacer()
                    }
                    .frame(width: 350, height: 55)
                    .background(.white)
                    .cornerRadius(10)
                    .border(Color.black, width: 1)
                }
                Button {
                    Task {
                        do {
                            try await viewModel.signInGoogle()
                            showSignInView = false
                        } catch {
                            print(error)
                        }
                    }
                } label: {
                    HStack {
                        Image("Google_Logo")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(.leading)
                        Spacer()
                        Text("Continue with Google")
                            .foregroundStyle(.black)
                        Spacer()
                    }
                    .frame(width: 350, height: 55)
                    .background(.white)
                    .cornerRadius(10)
                    .border(Color.black, width: 1)
                    
                }
                
            }
            .padding(.vertical, 90)
                
        }
        .padding ()
        .navigationTitle ("Login to Airbnb")
        Spacer()
    }
}

struct AuthenticationView_Preview : PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AuthenticationView(showSignInView: .constant(false))
        }
    }
}
