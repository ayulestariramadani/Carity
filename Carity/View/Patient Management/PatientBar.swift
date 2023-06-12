//
//  PatientBar.swift
//  Carity
//
//  Created by Rizaldi Septian Fauzi on 08/06/23.
//

import SwiftUI
import CloudKit

struct PatientBar: View {
    @ObservedObject var viewModel = PatientViewModel()
    @ObservedObject var patient: Patient
    
    @State private var showSheetOfEditPatient : Bool = false
    @State private var showSheetOfListPatients : Bool = false
    @State private var share: CKShare?
    @State private var showShareSheet = false
    @State private var showEditSheet = false
    private let stack = CoreDataStack.shared
    
    //    @Binding var patient_nickname : String
    //    @Binding var patient_disease : String
    @Binding var currentPatient : Patient?
    
    @Binding var patientIsSelected : Bool
    
    @Binding var addPatientIsPresented : Bool
    @State var editPatientIsPresented : Bool = false
    
    //alert
    @Binding var showDeletePatientAlert : Bool
    
    var body: some View {
        HStack{
            Menu{
                Button(action: {
                    //share patient
                    if !stack.isShared(object: patient) {
                        Task {
                            await createShare(patient)
                        }
                    }
                    showShareSheet = true
                    
                }) {
                    Label("Share", systemImage: "square.and.arrow.up")
                }
                Button(action: {
                    showDeletePatientAlert.toggle()
                }) {
                    Label("Delete", systemImage: "trash")
                }
                Button(action: {
                    showSheetOfEditPatient.toggle()
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
                        Text(currentPatient?.nickname ?? "").foregroundColor(Color("dark")).lineLimit(nil)
                        Spacer()
                        
                    }.font(.body).fontWeight(/*@START_MENU_TOKEN@*/.semibold/*@END_MENU_TOKEN@*/)
                    Spacer()
                    HStack{
                        Text(currentPatient?.disease ?? "").font(.footnote).fontWeight(/*@START_MENU_TOKEN@*/.semibold/*@END_MENU_TOKEN@*/).foregroundColor(Color("tale_main"))
                        Spacer()
                    }
                }
            }.padding(.all, 10.0)
                .frame(minWidth: 247, maxWidth: 259, minHeight: 67, maxHeight: 67)
                .background(patientIsSelected ? Color("sand_main") : Color("white"))
                .clipShape(RoundedRectangle(cornerRadius: 11))
                .navigationDestination(isPresented: $editPatientIsPresented, destination: {
                    AddPatient(
                        viewModel: PatientViewModel(),
                        nickname: currentPatient?.nickname ?? "",
                        fullName: currentPatient?.fullName ?? "",
                        birthdate: currentPatient?.birthdate ?? Date.now,
                        disease: currentPatient?.disease ?? "",
                        briefDescription: currentPatient?.briefDescription ?? "",
                        height: String(Int(currentPatient?.height ?? Int16(0))),
                        weight: String(Int(currentPatient?.weight ?? Int16(0))),
                        blood: currentPatient?.bloodType ?? "",
                        status: "Editing",
                        patient: currentPatient
                    )
                })
        } primaryAction: {
            showSheetOfEditPatient.toggle()
            //            editPatientIsPresented.toggle()
        }.sheet(isPresented: $showSheetOfEditPatient){
            AddPatient(
                viewModel: PatientViewModel(),
                nickname: currentPatient?.nickname ?? "",
                fullName: currentPatient?.fullName ?? "",
                birthdate: currentPatient?.birthdate ?? Date.now,
                disease: currentPatient?.disease ?? "",
                briefDescription: currentPatient?.briefDescription ?? "",
                height: String(Int(currentPatient?.height ?? Int16(0))),
                weight: String(Int(currentPatient?.weight ?? Int16(0))),
                blood: currentPatient?.bloodType ?? "",
                status: "Editing",
                patient: currentPatient
            )
            .presentationDetents([.fraction(0.95)])
        }
        .sheet(isPresented: $showShareSheet, content: {
            if let share = share {
                CloudSharingView(share: share, container: stack.ckContainer, patient: patient)
            }
        })
        .onAppear(perform: {
          self.share = stack.getShare(patient)
        })
        .alert(isPresented: $showDeletePatientAlert) {
            Alert(
                title: Text("""
                            Delete Patient "\(currentPatient?.nickname ?? "")"
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
                        deletePatient()
                    }
                )
            )
        }
            VStack{
                Button(action:{
                    self.addPatientIsPresented.toggle()
                }){
                    Label("Add Patient", systemImage: "plus")
                }.frame(minWidth: 100, maxWidth: 128, minHeight: 28, maxHeight: 28).background(Color("tale_main")).foregroundColor(Color("white"))
                    .clipShape(RoundedRectangle(cornerRadius: 11))
                    .sheet(isPresented: $addPatientIsPresented){
                        AddPatient(viewModel: PatientViewModel())
                            .presentationDetents([.fraction(0.95)])
                    }
                Button(action:{
                    showSheetOfListPatients.toggle()
                }){
                    Label("Switch", systemImage: "rectangle.2.swap")
                }.frame(minWidth: 100, maxWidth: 128, minHeight: 28, maxHeight: 28).background(Color("sand_main")).foregroundColor(Color("dark"))
                    .clipShape(RoundedRectangle(cornerRadius: 11))
                    .sheet(isPresented: $showSheetOfListPatients){
                        PatientList(viewModel: viewModel, currentPatient: $currentPatient)
                            .presentationDetents([.fraction(0.85)])
                    }
                
            }.font(.caption).fontWeight(.medium)
            
        }
    }
    
    func deletePatient() {
        viewModel.deletePatient(patient: currentPatient!)
        currentPatient = viewModel.patientList[0]
    }
}

extension PatientBar {
    private func createShare(_ patient: Patient) async {
        do {
            let (_, share, _) = try await stack.persistentContainer.share([patient], to: nil)
            share[CKShare.SystemFieldKey.title] = patient.description
            self.share = share
        } catch {
            print("Failed to create share")
        }
    }
    
    private func string(for permission: CKShare.ParticipantPermission) -> String {
        switch permission {
        case .unknown:
            return "Unknown"
        case .none:
            return "None"
        case .readOnly:
            return "Read-Only"
        case .readWrite:
            return "Read-Write"
        @unknown default:
            fatalError("A new value added to CKShare.Participant.Permission")
        }
    }
    
    private func string(for role: CKShare.ParticipantRole) -> String {
        switch role {
        case .owner:
            return "Owner"
        case .privateUser:
            return "Private User"
        case .publicUser:
            return "Public User"
        case .unknown:
            return "Unknown"
        @unknown default:
            fatalError("A new value added to CKShare.Participant.Role")
        }
    }
    
    private func string(for acceptanceStatus: CKShare.ParticipantAcceptanceStatus) -> String {
        switch acceptanceStatus {
        case .accepted:
            return "Accepted"
        case .removed:
            return "Removed"
        case .pending:
            return "Invited"
        case .unknown:
            return "Unknown"
        @unknown default:
            fatalError("A new value added to CKShare.Participant.AcceptanceStatus")
        }
    }
    
    private var canEdit: Bool {
        stack.canEdit(object: patient)
    }
}
