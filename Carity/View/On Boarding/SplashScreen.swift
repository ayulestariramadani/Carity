//
//  SplashScreen.swift
//  Carity
//
//  Created by mora hakim on 04/06/23.
//

import SwiftUI

struct SplashScreen: View {
    
    @State var isSplashActive: Bool = false
   
    
    var body: some View {
        ZStack {
            OnBoarding().opacity(isSplashActive ? 1 : 0)
            VStack{
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .opacity(isSplashActive ? 0 : 1)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation(.easeOut(duration: 0.5)){
                    self.isSplashActive = true
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
