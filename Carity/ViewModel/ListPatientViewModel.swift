//
//  ListPatientViewModel.swift
//  Carity
//
//  Created by mora hakim on 05/06/23.
//

import Foundation

class ListPatientViewModel: ObservableObject {
    @Published var patient: [Patient] = []
    
    init() {
        addPatient()
    }
    
    func addPatient() {
        patient = patientData
    }
    
    func delete(index: IndexSet) {
        patient.remove(atOffsets: index)
    }
}

let patientData = [
    Patient(nickName: "Rizaldi Septian Fauzi"),
    Patient(nickName: "Pahala Yuda Joshua Sihombing"),
    Patient(nickName: "Arman Maulana"),
    Patient(nickName: "Agung Hapsah"),
    Patient(nickName: "Yusuf Mahardika"),
    Patient(nickName: "Sulaiman Kimbap")
]
