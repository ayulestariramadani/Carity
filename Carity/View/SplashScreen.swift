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
        VStack {
            
            if self.isSplashActive {
                   OnBoarding()
            }else {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }
            
            
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
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
