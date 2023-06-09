//
//  AddPatient.swift
//  Carity
//
//  Created by mora hakim on 05/06/23.
//

import SwiftUI
import PhotosUI

struct AddPatient: View {
    
    @State var nickName: String = ""
    @State var fullName: String = ""
    @State var placeHolder = "Relation"
    var dropDownList = ["","Friend", "GrandMother", "GrandFather", "Mom", "Dad","Son", "Daughter", "Uncle", "Auntie", "Siblings"]
    
    @State private var birthDate = Date.now
    @State private var diseas: String = ""
    @State private var description: String = ""
    @State private var height: String = ""
    @State private var weight: String = ""
    
    @State private var blood = "Blood Type"
    @State private var bloodList = ["", "A", "B", "O", "AB"]
    @State var shouldShowImagePicker = false
    @State var image: UIImage?
    
    var body: some View {
       
            ZStack {
                Color.colorPrimary
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
                                .foregroundColor(Color.colorButton)
                        }
                        
                    }
                    .overlay(RoundedRectangle(cornerRadius: 100)
                        .stroke(Color.colorButton, lineWidth: 1)
                             
                    )
                    .padding(.top,20)
                    
                    Spacer()
                    
                    List {
                        
                        TextField("Nick name", text: $nickName)
                        TextField("Full name", text: $fullName)
                        
                        Picker("Relation", selection: $placeHolder) {
                            ForEach(dropDownList, id: \.self) {
                                Text($0)
                                    .foregroundColor(Color.black)
                            }
                        }
                        .pickerStyle(.menu)
                        
                        
                        DatePicker(selection: $birthDate, in: ...Date.now, displayedComponents: .date) {
                            Text("Select a date")
                        }
                        
                        
                        
                        TextField("Diseas", text: $diseas)
                        TextField("Description", text: $description, axis: .vertical)
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
                    .cornerRadius(10)
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
            
            .toolbar {
                Button("Save"){}
            }
       
        
    }
}

struct AddPatient_Previews: PreviewProvider {
    static var previews: some View {
        AddPatient()
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
