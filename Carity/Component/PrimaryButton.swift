//
//  PrimaryButton.swift
//  Carity
//
//  Created by mora hakim on 03/06/23.
//

import SwiftUI

struct PrimaryButton: View {
    
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 40, height: 52)
        }
        .background(Color.colorButton)
        .cornerRadius(10)

    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(title: "Halo") {
            print("Halo")
        }
    }
}
