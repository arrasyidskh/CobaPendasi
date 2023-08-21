import SwiftUI

struct EditProfilAnak: View {
    @State private var name: String = ""
    @State private var birthdate: Date = Date()
    @State private var isDatePickerVisible = false
    @State private var isSaved = false
    var isFormFilled: Bool {
        return !name.isEmpty && !birthdate.description.isEmpty
    }
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        return formatter
    }
    var formattedBirthdate: String {
        return dateFormatter.string(from: birthdate)
    }
    var body: some View {
        NavigationView {
            ZStack {
                Color("Abu")
                    .ignoresSafeArea()
                VStack {
                    TextField("Nama", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Button {
                        isDatePickerVisible = true
                    } label: {
                        Text("Tanggal Lahir: \(formattedBirthdate)")
                            .foregroundColor(.primary)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                            .multilineTextAlignment(.leading)
                            .disabled(true)
                    }
                    if isDatePickerVisible {
                        DatePicker(
                            selection: $birthdate,
                            displayedComponents: [.date]
                        ) {
                            Text("")
                        }
                        .datePickerStyle(WheelDatePickerStyle())
                        .padding()
                    }
                    Spacer()
                    Button {
                        isSaved = true
                    } label: {
                        Text("Simpan")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 358, height: 58)
                            .background(isFormFilled ? Color("Kuning") : Color.gray)
                            .cornerRadius(5)
                            .shadow(radius: 5)
                    }
                    .disabled(!isFormFilled)
                    .padding(.bottom, 16)
                }
                .toolbarBackground(Color.white, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .navigationTitle("Edit Profil Anak")
                .navigationBarTitleDisplayMode(.inline)
            }
            .fullScreenCover(isPresented: $isSaved) {
                ProfilAnak(name: name, birthdate: birthdate)
            }
        }
    }
}

struct EditProfilAnak_Previews: PreviewProvider {
    static var previews: some View {
        EditProfilAnak()
    }
}
