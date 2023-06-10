//
//  AddNotePage.swift
//  Carity
//
//  Created by mora hakim on 10/06/23.
//

import SwiftUI

struct AddNotePage: View {
    @State var isDatePickerVisible = false
    @State var selectedDate = Date()
    var body: some View {
        
        ZStack {
            Color("mint")
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "circle")
                        .resizable()
                        .frame(width: 17, height: 17)
                    Text("Choose Category")
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "chevron.down")
                            .foregroundColor(Color("tale_main"))
                    }
                    
                    
                    Spacer()
                    
                }
                .frame(height: 40)
                .frame(maxWidth: .infinity)
                .background(Color.white.cornerRadius(50)).padding()
                
                
                VStack {
                    
                    
                    Toggle("Date", isOn: $isDatePickerVisible)
                        .padding()
                    
                    
                    if isDatePickerVisible {
                        DatePicker("Pilih Tanggal", selection: $selectedDate, displayedComponents: .date)
                            .datePickerStyle(WheelDatePickerStyle())
                            .labelsHidden()
                            .padding()
                    }
                    
                    
                }
                
            }
            
            
            
        }
    }
}


struct ChooseDateAndTime: View {
    var body: some View {
        
        
        HStack {
            
        }
    }
}



struct AddNotePage_Previews: PreviewProvider {
    static var previews: some View {
        AddNotePage()
    }
}
