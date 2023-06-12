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
       
        VStack {
            Image("OnBoarding4")
                .resizable()
                .frame(width: 220, height: 200).hidden()
            Image("OnBoarding4")
                .resizable()
                .frame(width: 220, height: 200)
            Spacer()
            VStack(spacing: 10) {
                Spacer()
                Text ("Please add your first patient.")
                    .fontWeight(.semibold)
                    .font(.system(.title3))
                    .foregroundColor(Color("dark"))
                    .multilineTextAlignment(.leading)
                Spacer()
                Spacer()
            }
            .padding(.horizontal)
            VStack {
                Spacer()
                PrimaryButton(title: "Add Patient") {
                    isNavigate.toggle()
                }
                .navigationDestination(isPresented: $isNavigate) {
                    AddPatient(viewModel: PatientViewModel())
                }
                Spacer()
            }
        }
    }
}

struct AnnounceAddPatient_Previews: PreviewProvider {
    static var previews: some View {
        AnnounceAddPatient()
    }
}
