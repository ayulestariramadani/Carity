//
//  PatientList.swift
//  Carity
//
//  Created by Rizaldi Septian Fauzi on 09/06/23.
//

import SwiftUI

struct PatientList: View {
//    @StateObject var viewModel = ListPatientViewModel()
    @ObservedObject var viewModel: PatientViewModel
    @Binding var currentPatient : Patient?
    
    var body: some View {
        List{
            ForEach(viewModel.patientList,id:\.id) { patient in
                Button( action:{
                    //choose patient
                    currentPatient = patient
                }){
                    PatientCard(image: "patient", nickName: patient.nickname!, disease: patient.disease!)
                }
            }
        }.listStyle(.inset).cornerRadius(11).navigationBarTitle("Patients")
    }
}
