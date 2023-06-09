//
//  PatientBar.swift
//  Carity
//
//  Created by Rizaldi Septian Fauzi on 08/06/23.
//

import SwiftUI

struct PatientBar: View {
    @Binding var patient_nickname : String
    @Binding var patient_disease : String
    
    @Binding var patientIsSelected : Bool
    
    //alert
    @Binding var showDeletePatientAlert : Bool
    
    var body: some View {
        HStack{
            Menu{
                Button(action: {
                    //share patient
                }) {
                    Label("Share", systemImage: "square.and.arrow.up")
                }
                Button(action: {
                    showDeletePatientAlert.toggle()
                }) {
                    Label("Delete", systemImage: "trash")
                }
                Button(action: {
                    //duplicate patient
                }) {
                    Label("Duplicate", systemImage: "plus.square.on.square")
                }
                Button(action: {
                    //edit patient
                }) {
                    Label("Edit", systemImage: "pencil")
                }
            }
        label: {
            HStack{
                Image("patient").resizable()
                    .frame(width: 46, height: 46)
                    .clipShape(Circle())
                VStack{
                    HStack(alignment: .bottom){
                        Text(patient_nickname).foregroundColor(Color("dark")).lineLimit(nil)
                        Spacer()
                        
                    }.font(.body).fontWeight(/*@START_MENU_TOKEN@*/.semibold/*@END_MENU_TOKEN@*/)
                    Spacer()
                    HStack{
                        Text(patient_disease).font(.footnote).fontWeight(/*@START_MENU_TOKEN@*/.semibold/*@END_MENU_TOKEN@*/).foregroundColor(Color("tale_main"))
                        Spacer()
                    }
                }
            }.padding(.all, 10.0)
                .frame(minWidth: 247, maxWidth: 259, minHeight: 67, maxHeight: 67)
                .background(patientIsSelected ? Color("sand_main") : Color("white"))
                .clipShape(RoundedRectangle(cornerRadius: 11))
        } primaryAction: {
            //edit patient
        }.alert(isPresented: $showDeletePatientAlert) {
            Alert(
                title: Text("""
                            Delete Patient "\(patient_nickname)"
                            """),
                message: Text("This patient will be deleted from all your devices. You can't undo this action."),
                primaryButton: .default(
                    Text("Cancel").fontWeight(.bold),
                    action: {}
                ),
                secondaryButton: .destructive(
                    Text("Delete"),
                    action: {
                        //delete patient
                    }
                )
            )
        }
            VStack{
                Button(action:{
                    //add patient
                }){
                    Label("Add Patient", systemImage: "plus")
                }.frame(minWidth: 100, maxWidth: 128, minHeight: 28, maxHeight: 28).background(Color("tale_main")).foregroundColor(Color("white"))
                    .clipShape(RoundedRectangle(cornerRadius: 11))
                Button(action:{
                    //change patient
                }){
                    Label("Switch", systemImage: "rectangle.2.swap")
                }.frame(minWidth: 100, maxWidth: 128, minHeight: 28, maxHeight: 28).background(Color("sand_main")).foregroundColor(Color("dark"))
                    .clipShape(RoundedRectangle(cornerRadius: 11))
            }.font(.caption).fontWeight(.medium)
        }
    }
}