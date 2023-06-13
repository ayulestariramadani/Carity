//
//  NoteCard.swift
//  Carity
//
//  Created by Rizaldi Septian Fauzi on 08/06/23.
//

import SwiftUI

struct NoteCard: View {    
    var title : String = ""
    var content : String = ""
    var recordTime : Date = Date.now
    var recordDate : Date = Date.now
    var labelSFSymbol : String = ""
    var labelText : String = ""
    var isReminderActive : Bool = true
    var reminderTime : Date = Date.now
    
    var note_recordTime : String = ""
    var note_recordDate : String = ""
    @State private var note_labelSFSymbol : LabelSFSymbol?
    @State private var note_labelText : LabelText?
    
    var body: some View {
        HStack{
            note_labelSFSymbol.font(.system(size: 40)).frame(width: 60)
            VStack(alignment: .leading){
                Text(title).font(.subheadline).fontWeight(.semibold)
                Text(formattedDate(recordDate)).font(.caption2).fontWeight(.semibold)
                Spacer()
                note_labelText.font(.footnote).fontWeight(.semibold)
            }
            Spacer()
            VStack(alignment: .trailing){
                if isReminderActive {
                    Image(systemName: "alarm.fill").frame(width: 30, height: 30).background(Color("sand_main")).foregroundColor(Color("dark"))
                        .clipShape(Circle())
                        .font(.subheadline)
                }
                Spacer()
                Text(note_recordTime).font(.caption2).fontWeight(.semibold)
            }
        }
        .padding(.horizontal, 8.0).frame(width: 358, height: 60).foregroundColor(Color("dark"))
        .onAppear{
            note_labelSFSymbol = LabelSFSymbol.fromString(labelSFSymbol)!
            note_labelText = LabelText.fromString(labelText)!
        }
    }
    
    func formattedDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: date)
    }
    
    private func formattedTime(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
}
