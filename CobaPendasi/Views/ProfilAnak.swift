import SwiftUI

struct ProfilAnak: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var mpasiMenu: FetchedResults<MpasiMenu>
    let name: String
    let birthdate: Date
    var body: some View {
        NavigationView {
            ZStack {
                Color("Abu")
                    .ignoresSafeArea()
                VStack {
                    VStack {
                        HStack {
                            Text("Nama")
                                .font(.body)
                                .fontWeight(.regular)
                            Spacer()
                            Text(name)
                                .font(.body)
                                .fontWeight(.regular)
                                .foregroundColor(Color("Abu1"))
                        }
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                        Divider()
                        HStack {
                            Text("Tanggal Lahir")
                                .font(.body)
                                .fontWeight(.regular)
                            Spacer()
                            Text(dateToString(date: birthdate))
                                .font(.body)
                                .fontWeight(.regular)
                                .foregroundColor(Color("Abu1"))
                        }
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                    }
                    .padding(.bottom, 600)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: EditProfilAnak()) {
                            Text("Ubah")
                        }
                    }
                }
                .toolbarBackground(Color.white, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .navigationTitle("Profil Anak")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        return formatter.string(from: date)
    }
}
struct ProfilAnak_Previews: PreviewProvider {
    static var previews: some View {
        ProfilAnak(name: "Input Your Child Name", birthdate: Date())
    }
}
