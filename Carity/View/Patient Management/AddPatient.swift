//
//  AddPatient.swift
//  Carity
//
//  Created by mora hakim on 05/06/23.
//

import SwiftUI
import PhotosUI

struct AddPatient: View {
    
    //    let numberFormatter: NumberFormatter = {
    //            let nf = NumberFormatter()
    //            nf.locale = Locale.current
    //            //Set up the NumberFormatter as you like...
    //            nf.numberStyle = .decimal
    //            nf.maximumFractionDigits = 2
    //            return nf
    //        }()
    
    @State var nickName: String = ""
    @State var fullName: String = ""
    
    @State private var birthDate = Date.now
    @State private var disease: String = ""
    @State private var description: String = ""
    @State private var height: String = ""
    @State private var weight: String = ""
    
    @State private var blood = "Blood Type"
    @State private var bloodList = ["", "A+", "B+", "O+", "AB+", "A", "B", "O", "AB", "A-", "B-", "O-", "AB-"]
    
    @State var shouldShowImagePicker = false
    @State var image: UIImage?
    
    @State var isSaved = false
    
    @State var showDeletePatientAlert = false
    
    var body: some View {
        ZStack {
            Color("mint").edgesIgnoringSafeArea(.all)
            VStack(spacing: 10) {
                
                HStack{
                    Spacer()
                    Menu{
                        Button(action: {
                            //share patient
                        }) {
                            Label("Share", systemImage: "square.and.arrow.up")
                        }
                        Button(action: {
                            showDeletePatientAlert.toggle()
                        }) {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                label: {
                    Image(systemName: "ellipsis.circle")
                }.alert(isPresented: $showDeletePatientAlert) {
                    Alert(
                        title: Text("""
                            Delete Patient "\(nickName)"
                            """),
                        message: Text("This patient will be deleted from all your devices. You can't undo this action."),
                        primaryButton: .default(
                            Text("Cancel").fontWeight(.bold),
                            action: {}
                        ),
                        secondaryButton: .destructive(
                            Text("Delete"),
                            action: {
                                //delete patient
                            }
                        )
                    )
                }
                    Button("Save"){
                        self.isSaved.toggle()
                    }.navigationDestination(isPresented: $isSaved) {
                        Dashboard()
                    }
                }.font(.system(.headline))
                .padding([.top, .leading, .trailing], 16.0)
                
                Button {
                    shouldShowImagePicker.toggle()
                } label: {
                    VStack{
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
                        Text("Edit Photo")
                        
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
                    
                    DatePicker(selection: $birthDate, in: ...Date.now, displayedComponents: .date) {
                        Text("Select a date")
                    }
                    
                    TextField("Disease", text: $disease)
                    TextField("Description", text: $description, axis: .vertical)
                        .lineLimit(5, reservesSpace: true)
                    HStack {
                        Text("Height")
                        TextField("Height",text: $height)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                        Text("cm")
                            .padding(.trailing, 4)
                    }
                    
                    HStack {
                        Text("Weight")
                        TextField("Weight",text: $weight)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                        Text("kg ")
                            .padding(.trailing, 5)
                    }
                    Picker("Blood Type", selection: $blood) {
                        ForEach(bloodList, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    
                    
                }
                .foregroundColor(Color.black)
                .pickerStyle(.menu)
                
                .cornerRadius(11)
                .padding(.horizontal)
                .listStyle(PlainListStyle())
                .background(Color.colorPrimary)
                .onTapGesture {}
                .onLongPressGesture(
                    pressing: { isPressed in if isPressed { self.endEditing() } },
                    perform: {})
                
            }
            .autocorrectionDisabled(true)
            .navigationViewStyle(StackNavigationViewStyle())
            .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
                ImagePicker(image: $image)
                    .ignoresSafeArea()
            }
            
        }.navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .automatic){
                    Menu{
                        Button(action: {
                            //share patient
                        }) {
                            Label("Share", systemImage: "square.and.arrow.up")
                        }
                        Button(action: {
                            showDeletePatientAlert.toggle()
                        }) {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                label: {
                    Image(systemName: "ellipsis.circle")
                }.alert(isPresented: $showDeletePatientAlert) {
                    Alert(
                        title: Text("""
                            Delete Patient "\(nickName)"
                            """),
                        message: Text("This patient will be deleted from all your devices. You can't undo this action."),
                        primaryButton: .default(
                            Text("Cancel").fontWeight(.bold),
                            action: {}
                        ),
                        secondaryButton: .destructive(
                            Text("Delete"),
                            action: {
                                //delete patient
                            }
                        )
                    )
                }
                    Button("Save"){
                        self.isSaved.toggle()
                    }.navigationDestination(isPresented: $isSaved) {
                        Dashboard()
                    }
                }
            }
    }
}

struct AddPatient_Previews: PreviewProvider {
    static var previews: some View {
        AddPatient()
    }
}

extension View {
    func endEditing(){
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
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context){
    }
}
