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
    Patient(name: "Rizaldi Septian Fauzi"),
    Patient(name: "Pahala Yuda Joshua Sihombing"),
    Patient(name: "Arman Maulana"),
    Patient(name: "Agung Hapsah"),
    Patient(name: "Yusuf Mahardika"),
    Patient(name: "Sulaiman Kimbap")
]
