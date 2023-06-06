//
//  AnnounceAddPatient.swift
//  Carity
//
//  Created by mora hakim on 03/06/23.
//

import SwiftUI

struct AnnounceAddPatient: View {
    
    @State var isNavigate: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("Please add your patient")
                    .font(.custom("SF Pro Text", size: 20))
                    .fontWeight(.bold)
                Spacer()
                PrimaryButton(title: "Add Patient") {
                    isNavigate.toggle()
                }
                .navigationDestination(isPresented: $isNavigate) {
                    AddPatient()
                }
                
            }
            
            
        }
        

    }
}

struct AnnounceAddPatient_Previews: PreviewProvider {
    static var previews: some View {
        AnnounceAddPatient()
    }
}
