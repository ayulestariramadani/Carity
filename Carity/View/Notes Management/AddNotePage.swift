//
//  AddNotePage.swift
//  Carity
//
//  Created by mora hakim on 10/06/23.
//

import SwiftUI

struct AddNotePage: View {
    @State private var isDateVisible = false
    @State private var isTimeVisible = false
    @State private var note_tittle : String = ""
    @State private var note : String = ""
    @State private var selectedDate = Date()
    @State private var selectedTime: Date = Date()
    @State private var isToggle = false
    @State private var selectedOption = ""
    @State private var nameCategory: String = ""
    @State private var imageCategory: String = ""
    @State private var isToggleCategory = false
    @State private var selectedCategory : String = ""
    
    let values: [String] = LabelText.allCases.map { $0.rawValue }
    let icons: [String] = LabelSFSymbol.allCases.map { $0.rawValue }
    //    let colors: [String] = ["condition", "condition", "assessment", "assessment", "treatment", "treatment", "behaviour", "behaviour", "50%"]
    
    func getIndex (label : String) -> Int {
        if label != "" {
            return values.firstIndex(of: label) ?? 0
        } else {
            return 0
        }
    }
    
    func labelColor(label : String) -> String {
        switch label {
        case "Symptom", "Allergy and Intolerance" :
            return "condition"
        case "Consultation", "Clinical Document" :
            return "assessment"
        case "Medication", "Food and Nutrition" :
            return "treatment"
        case "Ritual", "Habit and Preference" :
            return "behaviour"
        case "Others" :
            return "50%"
        default :
            return "tale_main"
        }
    }
    
    var body: some View {
        ZStack {
            Color("mint").ignoresSafeArea()
            List {
                Section {
                    Button {
                        isToggleCategory.toggle()
                    } label: {
                        HStack {
                            if selectedCategory == "" {
                                Image(systemName: "tag.fill").foregroundColor(Color("tale_main"))
                                Text("Choose Catagory")
                            } else {
                                let icon = icons[getIndex(label: selectedCategory)]
                                Image(systemName: icon)
                                    .foregroundColor(Color(labelColor(label: selectedCategory)))
                                Text(selectedCategory)
                            }
                            Spacer()
                            Image(systemName: "chevron.down")
                        }.foregroundColor(Color.black)
                    }
                    if isToggleCategory {
                        Button {
                            
                        } label: {
                            HStack {
                                Picker(selection: $selectedCategory, label: Text("\(selectedCategory)")) {
                                    ForEach(Array(zip(values,icons)), id: \.0) { value, icon in
                                        HStack {
                                            Image(systemName: icon).foregroundColor(Color("tale_main"))
                                            Spacer()
                                            Text(value)
                                        }
                                    }
                                }.pickerStyle(WheelPickerStyle())
                            }
                        }
                    }
                    HStack {
                        Image(systemName: "alarm.fill").foregroundColor(Color(isToggle ? "tale_main" : "50%"))
                        Text("Set Reminder").foregroundColor(Color.black)
                            .foregroundColor(Color("tale_main"))
                        Toggle("", isOn: $isToggle)
                            .padding()
                    }
                    
                    if isToggle {
                        Button(action: {
                            isDateVisible.toggle()
                        }) {
                            HStack{
                                Text("\(Image(systemName: "calendar"))").foregroundColor(Color("tale_main"))
                                Text("\(formattedDate(selectedDate))")
                                Spacer()
                                Text("\(Image(systemName: "chevron.down"))").foregroundColor(Color.blue)
                            }.foregroundColor(Color.black)
                        }
                        
                        if isDateVisible {
                            DatePicker(selection: $selectedDate, in: Date()..., displayedComponents: .date) {
                                Text("Select a date")
                            }
                            .datePickerStyle(WheelDatePickerStyle())
                            .labelsHidden()
                            .padding()
                            .onChange(of: selectedDate) { _ in
                                isDateVisible.toggle()
                            }
                        }
                        
                        Button(action: {
                            isTimeVisible.toggle()
                        }) {
                            HStack{
                                Text("\(Image(systemName: "alarm"))").foregroundColor(Color("tale_main"))
                                Text("\(formattedTime(from: selectedTime))")
                                Spacer()
                                Text("\(Image(systemName: "chevron.down"))").foregroundColor(Color.blue)
                            }.foregroundColor(Color.black)
                        }
                        
                        if isTimeVisible {
                            DatePicker(selection: $selectedTime, displayedComponents: .hourAndMinute) {
                                Text("Select a time")
                            }
                            .datePickerStyle(WheelDatePickerStyle())
                            .labelsHidden()
                            .padding()
                            .onChange(of: selectedTime) { _ in
                                isTimeVisible.toggle()
                            }
                        }
                    }
                }
                Section {
                    TextField("Title", text: $note_tittle, axis: .vertical).font(Font.system(.largeTitle)).fontWeight(.bold).foregroundColor(Color(labelColor(label: selectedCategory)))
                    TextField("Note", text: $note, axis: .vertical)
                        .lineLimit(23, reservesSpace: true)
                }.autocorrectionDisabled(true)
            }.pickerStyle(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Picker Style@*/DefaultPickerStyle()/*@END_MENU_TOKEN@*/)
        }.background(Color("mint"))
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

struct AddNotePage_Previews: PreviewProvider {
    static var previews: some View {
        AddNotePage()
    }
}
