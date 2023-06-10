//
//  PatientCard.swift
//  Carity
//
//  Created by Rizaldi Septian Fauzi on 09/06/23.
//

import SwiftUI

struct PatientCard: View {
    var image: String
    var nickName: String
    var disease: String
    
    var body: some View {
        HStack{
            Image(image).resizable()
                .frame(width: 46, height: 46)
                .clipShape(Circle())
            VStack{
                HStack(alignment: .bottom){
                    Text(nickName).foregroundColor(Color("dark")).lineLimit(nil)
                    Spacer()
                    
                }.font(.body).fontWeight(/*@START_MENU_TOKEN@*/.semibold/*@END_MENU_TOKEN@*/)
                Spacer()
                HStack{
                    Text(disease).font(.footnote).fontWeight(/*@START_MENU_TOKEN@*/.semibold/*@END_MENU_TOKEN@*/).foregroundColor(Color("tale_main"))
                    Spacer()
                }
            }
        }.padding(.horizontal, 8.0).frame(width: 358, height: 60).foregroundColor(Color("dark"))
    }
}
