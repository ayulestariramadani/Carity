//
//  OnSatu.swift
//  Carity
//
//  Created by mora hakim on 04/06/23.
//

import SwiftUI

struct OnBoarding: View {
    
    @AppStorage("firstScreenShow")
    var firstScreenShow: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Welcome to,")
                        .fontWeight(.bold)
                        .font(.system(size: 20))

                    Text("Carity")
                        .fontWeight(.bold)
                        .font(.system(size: 25))
                        .foregroundColor(Color.colorButton)
                       
                }
                .padding(.leading,24)
                .padding(.top, 60)
             
                TabView {
                    OnBoardingPage(title: "Hello!", text: "You will not be single-handedly spreading kindness. Carity will be there to help you do it, hand in hand.", image: "Onsatu", dismissButton: false)
                    OnBoardingPage(title: "Manage your information!",text: "Time is free, but it’s priceless. Make notes quickly, and retrieve them just as quickly! Carity helps you save and organize all your caregiving information.", image: "Ondua", dismissButton: false)
                    OnBoardingPage(title: "Share your information!", text: "Knowing your priorities is excellent. Busy and need to assign your caregiving tasks to others? Fret not, you can do it seamlessly with Carity.", image: "Ontiga", dismissButton: true)
                }
                .tabViewStyle(PageTabViewStyle())
                .navigationBarBackButtonHidden(true)
                .padding()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            .onAppear {
                UserDefaults.standard.firstScreenShow = true
            }

        }
              
    }
}



struct OnBoardingPage: View {
    let title: String
    let text: String
    let image: String
    let dismissButton: Bool
    
    @State private var isActive: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 17) {
                Spacer()
                Image(image)
                    .resizable()
                    .frame(width: 220, height: 200)
                
                VStack(alignment: .leading, spacing: 10) {
                    Spacer()
                    Text (title)
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                        .foregroundColor(Color.colorButton)
                        .multilineTextAlignment(.leading)
                    
                    
                    Text(text)
                        .font(.system(size: 14))
                        .multilineTextAlignment(.leading)
                    
                }
                .padding()
                Spacer()
                
                VStack {
                    
                    if dismissButton {
                        PrimaryButton(title: "Start") {
                            isActive.toggle()
                        }
                        .navigationDestination(isPresented: $isActive) {
                            SignUp()
                        }
                        
                    } else {
                        //
                    }
                    
                    
                }
                .navigationBarBackButtonHidden(true)
                Spacer()
                
                
            }
        }
    }
}

struct OnSatu_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}


