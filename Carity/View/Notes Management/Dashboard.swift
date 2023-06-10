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
    var total_note : Int = 0
     
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
                    if total_note == 0 {
                        Button("\(Image(systemName: "square.and.pencil")) Add Note", action: {
                            //add Note
                        }).font(.body).fontWeight(.semibold).frame(minWidth: 358, maxWidth: 398, minHeight: 60, maxHeight: 60).background(Color("white")).foregroundColor(Color("dark"))
                            .clipShape(RoundedRectangle(cornerRadius: 11))
                        List{
                            
                        }.listStyle(.plain).cornerRadius(11).hidden()
                    } else {
                        NoteReview(review_tittle: "Notes of The Week", isThisWeek : true, isRemindedSoon : false
                                   //                               , searchedText: $searchedText
                        )
                        NoteReview(review_tittle: "Upcoming Notes", isThisWeek : false, isRemindedSoon : true
                                   //                               , searchedText: $searchedText
                        )
                    }
                }
                .padding(.horizontal, 16.0).lineLimit(nil)
                
            }
            .toolbar(){
                ToolbarItem(placement: .bottomBar){
                    HStack{
                        if total_note > 1 {
                            Text("\(total_note) notes").font(.body).fontWeight(.bold).foregroundColor(Color("dark"))
                        } else if total_note == 1 {
                            Text("\(total_note) note").font(.body).fontWeight(.bold).foregroundColor(Color("dark"))
                        }
                        Spacer()
                        Button( action:{
                            //add Notes
                        }){
                            Image(systemName: "square.and.pencil")
                            Text("Add Note")
                        }.frame(minWidth: 100, maxWidth: 128, minHeight: 40, maxHeight: 45)
                            .foregroundColor(Color("tale_main"))
                            .clipShape(RoundedRectangle(cornerRadius: 11))
                            .font(.subheadline).fontWeight(.bold)
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
