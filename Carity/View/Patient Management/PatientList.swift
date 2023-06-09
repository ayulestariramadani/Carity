//
//  PatientList.swift
//  Carity
//
//  Created by Rizaldi Septian Fauzi on 09/06/23.
//

import SwiftUI

struct PatientList: View {
    @StateObject var viewModel = ListPatientViewModel()
    
    var body: some View {
        List{
            ForEach(viewModel.patients,id:\.id) { patient in
                Button( action:{
                    //choose patient
                }){
                    PatientCard(image: patient.image, nickName: patient.nickName, disease: patient.disease)
                }
            }
        }.listStyle(.inset).cornerRadius(11).navigationBarTitle("Patients")
    }
}
