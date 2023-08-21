import SwiftUI

struct Content: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var mpasiMenu: FetchedResults<MpasiMenu>
    @State private var name: String = ""
    @State private var birthDate: Date = Date()
    @State private var isPlanStarted = false
    @State private var isSkipped = false
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Abu")
                    .ignoresSafeArea()
                VStack(spacing: 0.0) {
                    VStack(spacing: 20.0) {
                        Image("OnBoarding")
                            .resizable()
                            .frame(width: 326.0, height: 314.0)
                        Text("Petualangan kuliner sehat dan lezat untuk si kecil dengan MPASI Mingguan")
                            .font(.callout)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.black)
                        TextField("Nama", text: $name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        DatePicker(
                            "Tanggal Lahir",
                            selection: $birthDate,
                            displayedComponents: [.date]
                        )
                        .datePickerStyle(.automatic)
                        .padding()
                        .navigationDestination(isPresented: $isPlanStarted) {
                            AddMenu()
                        }
                        .navigationBarBackButtonHidden(true)
                        Button {
                            generateRandomMenus()
                            isPlanStarted = true
                        } label: {
                            Text("Mulai Rencana")
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                .lineLimit(1)
                                .padding(.trailing, 100)
                                .padding(.leading, 94)
                                .padding(.top, 16)
                                .padding(.bottom, 16 )
                                .font(.title2)
                                .background(Color("AccentColor"))
                                .cornerRadius(8)
                                .foregroundColor(.white)
                                .shadow(radius: 5)
                        }
                    }
                }
                .padding(.horizontal, 16.0)
                .toolbarBackground(Color.white, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
            }
            .navigationBarItems(trailing:
                                    Button {
                isSkipped = true} label: { Text("Lewati") .foregroundColor(Color("Kuning"))
                }
                .navigationDestination(isPresented: $isSkipped) {
                    AddMenu()
                })
        }
        .navigationDestination(isPresented: $isPlanStarted) {
            ProfilAnak(name: name, birthdate: birthDate)
        }
        .background()
    }
    func generateRandomMenus() {
        let addMenu = AddMenu()
        addMenu.generateRandomMenus()
    }
}
struct Content_Previews: PreviewProvider {
    static var previews: some View {
        Content()
    }
}
