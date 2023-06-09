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
//    Patient(nickName: "Rizaldi Septian Fauzi"),
//    Patient(nickName: "Pahala Yuda Joshua Sihombing"),
//    Patient(nickName: "Arman Maulana"),
//    Patient(nickName: "Agung Hapsah"),
//    Patient(nickName: "Yusuf Mahardika"),
//    Patient(nickName: "Sulaiman Kimbap")
    Patient(nickName: "Yusuf", fullName: "Yusuf Marsudien", birthDate: "20-03-2023", diseas: "Sakit hati", description: "sakit hati karena ditinggal", height: 175, weight: 60, bloodType: "B", image: ""),
    Patient(nickName: "Ayu", fullName: "Ayu Lestar", birthDate: "20-03-2024", diseas: "Gagal Move On", description: "Ditinggal mantan", height: 160, weight: 55, bloodType: "B", image: "")
    Patient(nickName: "Han", fullName: "Hanifah binti norman", birthDate: "20-22-1999", diseas: "ga kenapa kenapa", description: "oke", height: 160, weight: 55, bloodType: "O", image: "")
]
