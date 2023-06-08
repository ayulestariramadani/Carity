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
    var total_note : Int = 8
     
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
                    NoteReview(review_tittle: "Notes of This Week", isThisWeek : true, isRemindedSoon : false
//                               , searchedText: $searchedText
                    )
                    NoteReview(review_tittle: "Notes to Be Reminded Soon", isThisWeek : false, isRemindedSoon : true
//                               , searchedText: $searchedText
                    )
                }
                .padding(.horizontal, 16.0).lineLimit(nil)
                
            }
            .toolbar(){
                ToolbarItem(placement: .bottomBar){
                    HStack{
                        if total_note > 1 {
                            Text("\(total_note) notes").font(.body).fontWeight(.bold).foregroundColor(Color("dark"))
                        } else {
                            Text("\(total_note) note").font(.body).fontWeight(.bold).foregroundColor(Color("dark"))
                        }
                        Spacer()
                        Button( action:{
                            //add Notes
                        }){
                            Image(systemName: "square.and.pencil").frame(minWidth: 40, maxWidth: 45, minHeight: 40, maxHeight: 45)
                                .background(Color("tale_main"))
                                .foregroundColor(Color("white"))
                                .clipShape(Circle())
                                .font(.subheadline).fontWeight(.bold)
                        }
                    }
                }
            }
        }
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
