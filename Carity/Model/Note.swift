//
//  Note.swift
//  Carity
//
//  Created by Rizaldi Septian Fauzi on 08/06/23.
//

import Foundation

struct NoteDummy: Identifiable {
    var id = UUID()
    var note_tittle : String
    var note_recordTime : String
    var note_recordDate : String
    var note_labelSFSymbol : LabelSFSymbol
    var note_labelText : LabelText
    var note_isReminded : Bool
}
