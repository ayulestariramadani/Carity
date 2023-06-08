//
//  NoteReview.swift
//  Carity
//
//  Created by Rizaldi Septian Fauzi on 08/06/23.
//

import SwiftUI

struct NoteReview: View {
    @StateObject var viewModel = ListNotesViewModel()

    var review_tittle : String
    
    var isThisWeek : Bool
    var isRemindedSoon : Bool
    
//    @Binding var searchedText : String
    
    var body: some View {
        List{
            HStack{
                Text(review_tittle).font(.body).fontWeight(.semibold)
                Spacer()
                if isThisWeek {
                    Button("Show More", action: {
                        //to notes
                    }).font(.footnote).fontWeight(.semibold)
                }
            }.foregroundColor(Color("dark"))
            ForEach(viewModel.notes,id:\.id) { note in
                if isRemindedSoon {
                    if note.note_isReminded {
                        NoteCard(note_tittle: note.note_tittle, note_recordTime: note.note_recordTime, note_recordDate: note.note_recordDate, note_labelSFSymbol: note.note_labelSFSymbol, note_labelText: note.note_labelText, note_isReminded: note.note_isReminded)
                    }
                } else {
                    NoteCard(note_tittle: note.note_tittle, note_recordTime: note.note_recordTime, note_recordDate: note.note_recordDate, note_labelSFSymbol: note.note_labelSFSymbol, note_labelText: note.note_labelText, note_isReminded: note.note_isReminded)
                }
            }
        }.listStyle(.inset).cornerRadius(11)
//            .searchable(text: $searchedText)
    }
}
