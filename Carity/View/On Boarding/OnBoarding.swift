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
                        .fontWeight(.semibold)
                        .font(.system(.title2))
                        .foregroundColor(Color("dark"))
                    
                    Text("Carity")
                        .fontWeight(.bold)
                        .font(.system(.largeTitle))
                        .foregroundColor(Color("tale_main"))
                    
                }
                TabView {
                    OnBoardingPage(title: "Hello!", text: "You will not be single-handedly spreading kindness. Carity will be there to help you do it, hand in hand.", image: "OnBoarding1", ButtonLabel: "Skip")
                    OnBoardingPage(title: "Manage your information!",text: "Time is free, but it’s priceless. Make notes quickly, and retrieve them just as quickly! Carity helps you save and organize all your caregiving information.", image: "OnBoarding2", ButtonLabel: "Skip")
                    OnBoardingPage(title: "Share your information!", text: "Knowing your priorities is excellent. Busy and need to assign your caregiving tasks to others? Fret not, you can do it seamlessly with Carity.", image: "OnBoarding3", ButtonLabel: "Start")
                }
                .tabViewStyle(PageTabViewStyle())
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
            }
            .padding(.all, 16.0)
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
    let ButtonLabel: String
    
    @State private var isActive: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            Image(image)
                .resizable()
                .frame(width: 220, height: 200)
            Spacer()
            VStack(alignment: .leading, spacing: 10) {
                Spacer()
                Text (title)
                    .fontWeight(.semibold)
                    .font(.system(.title3))
                    .foregroundColor(Color("tale_main"))
                    .multilineTextAlignment(.leading)
                Text(text)
                    .fontWeight(.regular)
                    .font(.system(.body))
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .padding(.horizontal)
            VStack {
                Spacer()
                PrimaryButton(title: ButtonLabel) {
                    isActive.toggle()
                }
                .navigationDestination(isPresented: $isActive) {
                    SignUp()
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct OnSatu_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}


