//
//  SignInEmailView.swift
//  AirbnbClone
//
//  Created by Divakar T R on 07/09/25.
//

import SwiftUI

@MainActor
final class SignInEmailViewModel: ObservableObject {
    
    @AppStorage("accountUser") private var userData: Data?
    
    @Published var accountUser = AccountUser()
    @Published var alertItem: AlertItem?
    
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    func retreiveUser() {
        guard let data = userData else { return print("error retrieving user data") }
        do{
            accountUser = try JSONDecoder().decode(AccountUser.self, from: data)
        } catch{
            print("Error retreiving user data: \(error.localizedDescription)")
        }
    }
    
    func saveChanges() {
        //guard isValidForm else { return }
        do{
            let data = try JSONEncoder().encode(accountUser)
            userData = data
        }
        catch {
            print("Error retreiving user data: \(error.localizedDescription)")
        }
        
    }
    
    var isValidForm: Bool {
        print("Inside isValidForm")
        guard !accountUser.name.isEmpty, !accountUser.email.isEmpty, !accountUser.password.isEmpty else {
            print("Inside invalid form")
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard accountUser.email.isValidEmail else{
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    func signUp() async throws {
        
        guard !accountUser.email.isEmpty, !accountUser.password.isEmpty else {
            print("No email or password found.")
            return
        }
        
        try await AuthenticationManager.shared.createUser(email: accountUser.email, password: accountUser.password)
       
    }
    
    func signIn() async throws {
        
        guard !accountUser.email.isEmpty, !accountUser.password.isEmpty else {
            print("No email or password found.")
            return
        }
        
        try await AuthenticationManager.shared.signInUser(email: accountUser.email, password: accountUser.password)
       
    }
    
}

struct SignInEmailView: View {
    
    @StateObject private var viewModel = SignInEmailViewModel()
    @FocusState private var focusedTextField: FormTextField?
    @Binding var showSignInView: Bool
    
    enum FormTextField{
        case name, email, password
    }
    
    var body: some View {
        
        NavigationStack{
            Form{
                Section(header: Text("Login Info")){
                    TextField("Name", text: $viewModel.accountUser.name)
                        .focused($focusedTextField, equals: .name)
                        .onSubmit {
                            focusedTextField = .email
                        }
                        .submitLabel(.next)
                    TextField("Email", text: $viewModel.accountUser.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit {
                            focusedTextField = .password
                        }
                        .submitLabel(.next)
                    SecureField("Password", text: $viewModel.accountUser.password)
                        .focused($focusedTextField, equals: .password)
                        .onSubmit {
                            focusedTextField = nil
                        }
                        .submitLabel(.continue)
                    Button {
                        Task {
                            do {
                                if (viewModel.isValidForm) {
                                    try await viewModel.signUp()
                                    viewModel.saveChanges()
                                    showSignInView = false
                                    return
                                }
                            } catch {
                                print(error)
                            }
                            do {
                                if (viewModel.isValidForm) {
                                    try await viewModel.signIn()
                                    viewModel.saveChanges()
                                    showSignInView = false
                                    return
                                }
                            } catch {
                                print(error)
                            }
                        }
                    } label: {
                        
                        Text("Sign In With Email")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.pink)
                            )
                        
                    }
                }
            }
            
            }
            .navigationTitle("😎 SignIn With Email")
            .toolbar{
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") { focusedTextField = nil }
                }
            }
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            }
    }
    
}

/*struct SignInEmailPreview: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignInEmailView(showSignInView: .constant(true))
        }
    }
}*/
