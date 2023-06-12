//
//  Dashboard.swift
//  Carity
//
//  Created by Rizaldi Septian Fauzi on 03/06/23.
//

import SwiftUI

struct Dashboard: View {
    @ObservedObject var viewModel: PatientViewModel
    
    @State private var currentPatient: Patient?
    
    @AppStorage("total_note")
    var total_note: Int = 0
    
    //caregiver_data
    var caregiver_firstname : String = "Kim"
    
    //patient_data
    @State private var patient_nickname : String = "Rizal"
    @State private var patient_disease : String = "Patah Hati"
    
    @State private var patientIsSelected : Bool = false
    
    @State private var addPatientIsPresented : Bool = false
    @State private var isNavigate : Bool = false
     
    //alert
    @State private var showDeletePatientAlert : Bool = false
    
    init() {
        self.viewModel = PatientViewModel()
    }

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
                    PatientBar(
                        patient: Patient(), currentPatient: $currentPatient,
                        patientIsSelected: $patientIsSelected,
                        addPatientIsPresented: $addPatientIsPresented,
                        showDeletePatientAlert: $showDeletePatientAlert)
                    Spacer(minLength: 11)
                    if total_note == 0 {
                        Button("\(Image(systemName: "square.and.pencil")) Add Note", action: {
                            isNavigate.toggle()
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
            .onAppear{
                self.currentPatient = viewModel.patientList.first
                self.patient_nickname = currentPatient?.nickname ?? ""
                self.patient_disease = currentPatient?.disease ?? ""
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
                                isNavigate.toggle()
                        }){
                            Image(systemName: "square.and.pencil")
                            Text("Add Note")
                        }.frame(minWidth: 100, maxWidth: 128, minHeight: 40, maxHeight: 45)
                            .foregroundColor(Color("tale_main"))
                            .clipShape(RoundedRectangle(cornerRadius: 11))
                            .font(.subheadline).fontWeight(.bold)
                    }
                }
            }.navigationDestination(isPresented: $isNavigate){AddNotePage()}
        }.navigationBarBackButtonHidden(true)
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
