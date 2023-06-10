//
//  ListNotesViewModel.swift
//  Carity
//
//  Created by Rizaldi Septian Fauzi on 08/06/23.
//

import Foundation

class ListNotesViewModel: ObservableObject {
    @Published var notes: [Note] = []
    
    init() {
        addNote()
    }
    
    func addNote() {
        notes = notesData
    }
    
    func delete(index: IndexSet){
        notes.remove(atOffsets: index)
    }
}

let notesData = [
    Note(
        note_tittle: "Resep Obat Patah Hati",
        note_recordTime: "09.40 am",
        note_recordDate: "Sun, 28 May 23",
        note_labelSFSymbol: .treatment_medication,
        note_labelText: .treatment_medication,
        note_isReminded: true
    ),Note(
        note_tittle: "Muntah 🤮",
        note_recordTime: "08.32 am",
        note_recordDate: "Fri, 26 May 23",
        note_labelSFSymbol: .condition_symptom,
        note_labelText: .condition_symptom,
        note_isReminded: false
    ),Note(
        note_tittle: "Kontrol Dokter Yusuf",
        note_recordTime: "09.03 am",
        note_recordDate: "Tue, 23 May 23",
        note_labelSFSymbol: .assessment_consultation,
        note_labelText: .assessment_consultation,
        note_isReminded: false
    ),Note(
        note_tittle: "Rute Jalan Sore 🚶🏻",
        note_recordTime: "04.55 pm",
        note_recordDate: "Tue, 23 May 23",
        note_labelSFSymbol: .behaviour_ritual,
        note_labelText: .behaviour_ritual,
        note_isReminded: true
    ),Note(
        note_tittle: "Resep Poached Pear",
        note_recordTime: "01.40 am",
        note_recordDate: "Sun, 26 Feb 23",
        note_labelSFSymbol: .treatment_foodAndNutrition,
        note_labelText: .treatment_foodAndNutrition,
        note_isReminded: true
    ),Note(
        note_tittle: "Resep Bubur Ayam",
        note_recordTime: "01.58 am",
        note_recordDate: "Sun, 26 Feb 23",
        note_labelSFSymbol: .treatment_foodAndNutrition,
        note_labelText: .treatment_foodAndNutrition,
        note_isReminded: true
    ),Note(
        note_tittle: "Alergi seafood",
        note_recordTime: "03.56 pm",
        note_recordDate: "Mon, 23 Jan 23",
        note_labelSFSymbol: .condition_allergyAndIntolerance,
        note_labelText: .condition_allergyAndIntolerance,
        note_isReminded: false
    ),Note(
        note_tittle: "Kebiasaan sebelum sakit!",
        note_recordTime: "11.36 pm",
        note_recordDate: "Wed, 21 Dec 22",
        note_labelSFSymbol: .behaviour_habitAndPreference,
        note_labelText: .behaviour_habitAndPreference,
        note_isReminded: false
    )
]
