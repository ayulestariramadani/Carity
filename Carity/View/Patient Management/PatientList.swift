//
//  PatientList.swift
//  Carity
//
//  Created by Rizaldi Septian Fauzi on 09/06/23.
//

import SwiftUI

struct PatientList: View {
    @StateObject var viewModel = ListPatientViewModel()
    
    @Binding var searchedText : String
    
    var body: some View {
        List{
            ForEach(viewModel.patient,id:\.id) { note in
                Button( action:{
                    //choose patient
                }){
                    
                }
            }
        }.listStyle(.inset).cornerRadius(11).navigationBarTitle("Notes")
            .searchable(text: $searchedText, prompt: "Search Note")
    }
}
