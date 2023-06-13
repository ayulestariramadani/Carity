//
//  AddNotePage.swift
//  Carity
//
//  Created by mora hakim on 10/06/23.
//

import SwiftUI

struct AddNotePage: View {
    @ObservedObject var viewModel: NoteViewModel
    
    @State private var isDateVisible = false
    @State private var isTimeVisible = false
    @State private var title : String = ""
    @State private var content : String = ""
    @State private var selectedDate = Date()
    @State private var selectedTime: Date = Date()
    @State private var isToggle = false
    @State private var selectedOption = ""
    @State private var nameCategory: String = ""
    @State private var imageCategory: String = ""
    @State private var isToggleCategory = false
    @State private var selectedCategory : String = ""
    
    @State private var isReminderActive : Bool = false
    
    @State var isSaved = false
    
//    @AppStorage("total_note")
    @Binding var total_note: Int
    
    
    
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
    
    func saveNoteData() {
        print("is saving..")
        viewModel.addNote(
            title: title,
            content: content,
            recordDate: Date.now,
            recordTime: Date.now,
            labelSFSymbol: icons[getIndex(label: selectedCategory)],
            labelText: values[getIndex(label: selectedCategory)],
            isReminderActive: isReminderActive,
            reminderTime: selectedTime)
        total_note = viewModel.noteList.count
        print(viewModel.noteList.count)
    }
    
    var body: some View {
        ZStack {
            Color("mint").ignoresSafeArea()
            List {
                Section {
                    Button {
                        withAnimation{
                            isToggleCategory.toggle()
                        }
                    } label: {
                        HStack {
                            if selectedCategory == "" {
                                Image(systemName: "tag.fill").foregroundColor(Color("tale_main"))
                                Text("Choose Category")
                            } else {
                                let icon = icons[getIndex(label: selectedCategory)]
                                Image(systemName: icon)
                                    .foregroundColor(Color(labelColor(label: selectedCategory)))
                                Text(selectedCategory)
                            }
                            Spacer()
                            Image(systemName: "chevron.down").foregroundColor(Color.blue).rotation3DEffect(.degrees(isToggleCategory ? 180 : 0), axis: (x: 1, y: 0, z: 0))
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
                            isReminderActive = true
                            withAnimation{
                                isDateVisible.toggle()
                            }
                        }) {
                            HStack{
                                Text("\(Image(systemName: "calendar"))").foregroundColor(Color("tale_main"))
                                Text("\(formattedDate(selectedDate))")
                                Spacer()
                                Text("\(Image(systemName: "chevron.down"))").foregroundColor(Color.blue).rotation3DEffect(.degrees(isDateVisible ? 180 : 0), axis: (x: 1, y: 0, z: 0))
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
                            withAnimation{
                                isTimeVisible.toggle()
                            }
                        }) {
                            HStack{
                                Text("\(Image(systemName: "alarm"))").foregroundColor(Color("tale_main"))
                                Text("\(formattedTime(from: selectedTime))")
                                Spacer()
                                Text("\(Image(systemName: "chevron.down"))").foregroundColor(Color.blue).rotation3DEffect(.degrees(isTimeVisible ? 180 : 0), axis: (x: 1, y: 0, z: 0))
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
                    TextField("Title", text: $title, axis: .vertical).font(Font.system(.largeTitle)).fontWeight(.bold).foregroundColor(Color(labelColor(label: selectedCategory)))
                    TextField("Note", text: $content, axis: .vertical)
                        .lineLimit(23, reservesSpace: true)
                }.autocorrectionDisabled(true)
            }.pickerStyle(WheelPickerStyle())
        }
        .onAppear{
//            total_note = viewModel.noteList.count
//            print(total_note)
            print(viewModel.patient?.nickname)
        }
        .background(Color("mint"))
        .toolbar{
            Button("Save"){
                self.isSaved.toggle()
//                    total_note = total_note + 1
                saveNoteData()
            }
//                .navigationDestination(isPresented: $isSaved) {
//                    Dashboard()
//                }
        }
        NavigationLink(destination: Dashboard(), isActive: $isSaved) {
            EmptyView()
        }
        .hidden()

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
