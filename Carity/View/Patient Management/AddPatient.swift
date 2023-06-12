//
//  AddPatient.swift
//  Carity
//
//  Created by mora hakim on 05/06/23.
//

import SwiftUI
import PhotosUI

struct AddPatient: View {
    @ObservedObject var viewModel: PatientViewModel
    @State var nickname: String = ""
    @State var fullName: String = ""
    @State var placeHolder = "Relation"
    var dropDownList = ["","Friend", "GrandMother", "GrandFather", "Mom", "Dad","Son", "Daughter", "Uncle", "Auntie", "Siblings"]
    
    @State var birthdate = Date.now
    @State var disease: String = ""
    @State var briefDescription: String = ""
    @State var height: String = ""
    @State var weight: String = ""
    
    @State var blood = "Blood Type"
    @State private var bloodList = ["", "A", "B", "O", "AB"]
    @State var shouldShowImagePicker = false
    @State var image: UIImage?
    
    @State var status = "Adding"
    
    @State var patient : Patient?
    
    func updatePatientData() {
        patient?.nickname = nickname
        patient?.fullName = fullName
        patient?.birthdate = birthdate
        patient?.disease = disease
        patient?.briefDescription = briefDescription
        patient?.height = Int16(Int(height)!)
        patient?.weight = Int16(Int(weight)!)
        patient?.bloodType = blood
        
        viewModel.updatePatient(patient: patient!)
    }
    
    func savePatientData() {
        viewModel.addPatient(
            nickname: nickname,
            fullName: fullName,
            birthdate: birthdate,
            disease: disease,
            briefDescription: briefDescription,
            height: Int(height)!,
            weight: Int(weight)!,
            bloodType: blood
        )
        
        nickname = ""
        fullName = ""
        placeHolder = "Relation"
        birthdate = Date.now
        disease = ""
        briefDescription = ""
        height = ""
        weight = ""
        blood = "Blood Type"
        image = nil
    }
    
    var body: some View {
       
            ZStack {
                Color("mint")
                    .edgesIgnoringSafeArea(.bottom)
                VStack(spacing: 10) {
                    Button {
                        shouldShowImagePicker.toggle()
                    } label: {
                        if let image = self.image {
                            Image(uiImage: image)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(100)
                            
                        }else {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .foregroundColor(Color("tale_main"))
                        }
                        
                    }
                    
                    .overlay(RoundedRectangle(cornerRadius: 100)
                        .stroke(Color.colorButton, lineWidth: 1)
                             
                    )
                    .padding(.top,20)
                    
                    Spacer()
                    
                    List {
                        
                        TextField("Nickname", text: $nickname)
                        TextField("Full name", text: $fullName)
                        
                        Picker("Relation", selection: $placeHolder) {
                            ForEach(dropDownList, id: \.self) {
                                Text($0)
                                    .foregroundColor(Color.black)
                            }
                        }
                        .pickerStyle(.menu)
                        
                        
                        DatePicker(selection: $birthdate, in: ...Date.now, displayedComponents: .date) {
                            Text("Select a date")
                        }
                        
                        
                        
                        TextField("Disease", text: $disease)
                        TextField("Description", text: $briefDescription, axis: .vertical)
                            .lineLimit(5, reservesSpace: true)
                        
                        
                        HStack {
                            TextField("Height", text: $height)
                                .keyboardType(.numberPad)
                            Text("Cm")
                                .padding(.trailing, 5)
                        }
                        
                        HStack {
                            TextField("Weight", text: $weight)
                                .keyboardType(.numberPad)
                            Text("Kg")
                                .padding(.trailing, 5)
                        }
                        Picker("Blood Type", selection: $blood) {
                            ForEach(bloodList, id: \.self) {
                                Text($0)
                                    
                            }
                            
                        }
                        .foregroundColor(Color.black)
                        .pickerStyle(.menu)
                    }
                    .cornerRadius(11)
                    .padding(.horizontal)
                    .listStyle(PlainListStyle())
                    .background(Color.colorPrimary)
                    .onTapGesture {}
                    .onLongPressGesture(
                        pressing: { isPressed in if isPressed { self.endEditing() } },
                        perform: {})
                    
                    
                }
                .navigationViewStyle(StackNavigationViewStyle())
                .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
                    ImagePicker(image: $image)
                        .ignoresSafeArea()
                }
            }
            .navigationBarBackButtonHidden(true)
            
            .toolbar {
                Button("Save"){
                    if(status == "Adding"){
                        savePatientData()
                    }
                    else{
                        updatePatientData()
                    }
                }
            }
       
        
    }
}

struct AddPatient_Previews: PreviewProvider {
    static var previews: some View {
        AddPatient(viewModel: PatientViewModel())
    }
}

extension View {
    func endEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var image: UIImage?
    
    private let controller = UIImagePickerController()
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        let parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            parent.image = info[.originalImage] as? UIImage
            picker.dismiss(animated: true)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
        
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
}
