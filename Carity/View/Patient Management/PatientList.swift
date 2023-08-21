//
//  PatientList.swift
//  Carity
//
//  Created by Rizaldi Septian Fauzi on 09/06/23.
//

import SwiftUI

struct PatientList: View {
//    @StateObject var viewModel = ListPatientViewModel()
    @StateObject var viewModel: PatientViewModel
    @Binding var currentPatient : Patient?
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        List{
            ForEach(viewModel.patientList,id:\.id) { patient in
                Button( action:{
                    //choose patient
                    currentPatient = patient
                    presentationMode.wrappedValue.dismiss()
                }){
                    PatientCard(image: "patient", nickName: patient.nickname!, disease: patient.disease!)
                }
            }
        }.listStyle(.inset).cornerRadius(11).navigationBarTitle("Patients")
    }
}
