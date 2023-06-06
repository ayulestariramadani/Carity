//
//  ContentView.swift
//  Carity
//
//  Created by Ayu Lestari Ramadani on 24/05/23.
//

import SwiftUI

extension UserDefaults{
    
    var firstScreenShow: Bool {
        get {
            return (UserDefaults.standard.value(forKey: "firstScreenShow") as? Bool) ?? false
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "firstScreenShow")
        }
    }
  
}

struct ContentView: View {
    
    var body: some View {
        if UserDefaults.standard.firstScreenShow {
            SplashScreen()
        }else {
            OnBoarding()
        }
        
    }
}

