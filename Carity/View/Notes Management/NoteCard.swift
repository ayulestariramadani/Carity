//
//  NoteCard.swift
//  Carity
//
//  Created by Rizaldi Septian Fauzi on 08/06/23.
//

import SwiftUI

struct NoteCard: View {    
    var note_tittle : String
    var note_recordTime : String
    var note_recordDate : String
    var note_labelSFSymbol : LabelSFSymbol
    var note_labelText : LabelText
    
    var note_isReminded : Bool
    
    var body: some View {
        HStack{
            note_labelSFSymbol.font(.system(size: 40)).frame(width: 60)
            VStack(alignment: .leading){
                Text(note_tittle).font(.subheadline).fontWeight(.semibold)
                Text(note_recordDate).font(.caption2).fontWeight(.semibold)
                Spacer()
                note_labelText.font(.footnote).fontWeight(.semibold)
            }
            Spacer()
            VStack(alignment: .trailing){
                if note_isReminded {
                    Image(systemName: "alarm.fill").frame(width: 30, height: 30).background(Color("sand_main")).foregroundColor(Color("dark"))
                        .clipShape(Circle())
                        .font(.subheadline)
                }
                Spacer()
                Text(note_recordTime).font(.caption2).fontWeight(.semibold)
            }
        }.padding(.horizontal, 8.0).frame(width: 358, height: 60).foregroundColor(Color("dark"))
    }
}
