//
//  SignUp.swift
//  Carity
//
//  Created by mora hakim on 04/06/23.
//

import SwiftUI

struct SignUp: View {
    
    @State var isActive: Bool = false
    
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
                .cornerRadius(10)
            }
            .navigationDestination(isPresented: $isActive, destination: {
                AnnounceAddPatient()
            })
            .padding(.horizontal)
           
            Spacer()
            Spacer()
            Spacer()
        }
        
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
