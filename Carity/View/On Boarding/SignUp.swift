//
//  SignUp.swift
//  Carity
//
//  Created by mora hakim on 04/06/23.
//

import SwiftUI
import AuthenticationServices

struct SignUp: View {
    
    @State var isActive: Bool = false
    
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    @AppStorage("userId") var userId: String = ""
    
    private var isSignedIn: Bool{
        !userId.isEmpty
    }
    
    var body: some View {
        VStack(spacing: 15) {
            Spacer()
            Image("Logo")
                .resizable()
                .frame(width: 36, height: 50)
            
            Text("Carity")
                .font(.system(size: 20))
                .fontWeight(.bold)
            Text("A simple way to share your care")
                .font(.system(size: 12))
            
//            if !isSignedIn{
//                SignInButtonView()
//            }else{
//                AnnounceAddPatient()
//            }
            
            Button {
                self.isActive.toggle()
            } label: {
                HStack {
                    Image(systemName: "apple.logo")
                        .foregroundColor(.white)
                    Text("Sign up with Apple")
                        .font(.headline)
                        .foregroundColor(.white)

                }
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .cornerRadius(11)
            }
            .navigationDestination(isPresented: $isActive, destination: {
                AnnounceAddPatient(viewModel: PatientViewModel())
            })
            .padding(.horizontal)
           
            Spacer()
            Spacer()
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

struct SignInButtonView: View{
    
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    @AppStorage("userId") var userId: String = ""
    
    
    
    var body: some View {
        SignInWithAppleButton(.continue) { request in
            // request for credential we need
            request.requestedScopes = [.email, .fullName]
            
        } onCompletion: { result in
            // action for success or failure case
            switch result{
            case .success(let auth):
                switch auth.credential{
                case let credential as ASAuthorizationAppleIDCredential:
                    // User ID
                    let userId = credential.user
                    print(userId)
                    // User Info
                    let email = credential.email
                    let firstName = credential.fullName?.givenName
                    let lastName = credential.fullName?.familyName
                    
                    // Assign the credential to variable appstorage
                    self.email = email ?? ""
                    self.firstName = firstName ?? ""
                    self.lastName = lastName ?? ""
                    self.userId = userId
                    
                    break
                default:
                    break
                }
            case .failure(let error):
                print(error)
            }
        }
        .frame(height: 50)
        .padding()
        .cornerRadius(8)
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
