//
//  Dashboard.swift
//  Carity
//
//  Created by Rizaldi Septian Fauzi on 03/06/23.
//

import SwiftUI

struct Dashboard: View {
    //caregiver_data
    var caregiver_firstname : String = "Kim"
    
    //patient_data
    @State private var patient_nickname : String = "Rizal"
    @State private var patient_disease : String = "Patah Hati"
    
    @State private var patientIsSelected : Bool = false
    
    //note_data
    @State private var note_tittle : String = "Resep Obat Patah Hati"
    @State private var note_recordTime : String = "Sunday, 09.40 am"
    @State private var note_recordDate : String = "28/05/23"
    @State private var note_labelSFSymbol : LabelSFSymbol = .treatment_medication
    @State private var note_labelText : LabelText = .treatment_medication

    @State private var note_isReminded : Bool = true
    
    @State private var searchedText : String = ""
     
    //alert
    @State private var showDeletePatientAlert : Bool = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color("mint").ignoresSafeArea()
                VStack{
                    HStack{
                        Text("Hi, \(caregiver_firstname)").font(.largeTitle.bold()).foregroundColor(Color("dark"))
                        Spacer()
                    }
                    Spacer(minLength: 11)
                    PatientBar(patient_nickname: $patient_nickname, patient_disease: $patient_disease, patientIsSelected: $patientIsSelected, showDeletePatientAlert: $showDeletePatientAlert)
                    Spacer(minLength: 11)
                    NoteReview(review_tittle: "This Week", isThisWeek : true, isRemindedSoon : false
//                               , searchedText: $searchedText
                    )
                    NoteReview(review_tittle: "Reminded Soon", isThisWeek : false, isRemindedSoon : true
//                               , searchedText: $searchedText
                    )
                }
                .padding(.horizontal, 16.0).lineLimit(nil)
            }
        }
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
