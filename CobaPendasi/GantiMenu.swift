import SwiftUI

struct GantiMenuView: View {
    @State private var menus: [Menu] = []
    let proteins: [Protein] = [
        Protein(name: "Daging Ayam", imageName: "dagingAyam"),
        Protein(name: "Daging Sapi", imageName: "dagingSapi"),
        Protein(name: "Daging Kambing", imageName: "dagingKambing"),
        Protein(name: "Hati Ayam", imageName: "hatiAyam"),
        Protein(name: "Telur Bebek", imageName: "telurBebek"),
        Protein(name: "Telur Ayam", imageName: "telurAyam"),
        Protein(name: "Telur Puyuh", imageName: "telurPuyuh"),
        Protein(name: "Ikan Tenggiri", imageName: "ikanTenggiri"),
        Protein(name: "Ikan Kakap", imageName: "ikanKakap"),
        Protein(name: "Ikan Kembung", imageName: "ikanKembung"),
        Protein(name: "Ikan Patin", imageName: "ikanPatin"),
        Protein(name: "Ikan Salmon", imageName: "ikanSalmon"),
        Protein(name: "Keju", imageName: "keju")
    ]
    let carbohidrats: [Carbohydrate] = [
        Carbohydrate(name: "Nasi", imageName: "nasi"),
        Carbohydrate(name: "Kentang", imageName: "kentang"),
        Carbohydrate(name: "Pasta", imageName: "pasta"),
        Carbohydrate(name: "Jagung", imageName: "jagung")
    ]
    let sideDishes = ["Brokoli", "Wortel", "Bayam", "Kacang Merah", "Tahu", "Tempe", "Buncis"]
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(menus, id: \.id) { menu in
                        NavigationLink(destination: DetailView(menu: menu)) {
                            Card(menu: menu)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Ganti Menu")
            .onAppear {
                generateRandomMenus()
            }
        }
    }
    func generateRandomMenus() {
        menus = []
        for _ in 0..<30 {
            let protein = proteins.randomElement() ?? Protein(name: "", imageName: "")
            let carbohidrat = carbohidrats.randomElement() ?? Carbohydrate(name: "", imageName: "")
            let sideDish = sideDishes.randomElement() ?? ""
            let menu = Menu(protein: protein, carbohidrat: carbohidrat, sideDish: sideDish)
            menus.append(menu)
        }
    }
    struct Card: View {
        let menu: Menu
        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(menu.protein.imageName)
                        .resizable()
                        .frame(width: 100, height: 100)
                    Image(menu.carbohidrat.imageName)
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                VStack(alignment: .leading, spacing: 4) {
                    Text("Protein: \(menu.protein.name)")
                    Text("Karbohidrat: \(menu.carbohidrat.name)")
                    Text("Pelengkap: \(menu.sideDish)")
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
        }
    }
    struct Menu {
        let id = UUID()
        let protein: Protein
        let carbohidrat: Carbohydrate
        let sideDish: String
    }
    struct Protein {
        let name: String
        let imageName: String
    }
    struct Carbohydrate {
        let name: String
        let imageName: String
    }
}
struct GantiMenuView_Previews: PreviewProvider {
    static var previews: some View {
        GantiMenuView()
    }
}
struct DetailView: View {
    let menu: GantiMenuView.Menu
    var body: some View {
        VStack {
            Text(menu.protein.name)
                .font(.title2)
                .padding()
            HStack {
                Image(menu.protein.imageName)
                    .resizable()
                    .frame(width: 100, height: 100)
                Image(menu.carbohidrat.imageName)
                    .resizable()
                    .frame(width: 100, height: 100)
            }
            .navigationBarTitle("Detail Menu")
        }
        Group {
            Text("BAHAN UTAMA")
                .font(.caption)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .padding(.trailing, 270.0)
                .padding(.top, 20)
                .foregroundColor(Color("Abu1"))
            Divider()
            HStack {
                Text("Protein")
                    .font(.body)
                    .fontWeight(.regular)
                Spacer()
                Spacer()
                Spacer()
                Text("Daging Ayam")
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color("Abu1"))
                Text("-")
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color("Abu1"))
                Text("100")
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color("Abu1"))
                Text("gram")
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color("Abu1"))
            }
            .frame(width: 360, height: 20)
            Divider()
            HStack {
                Text("Karbohidrat")
                    .font(.body)
                    .fontWeight(.regular)
                Spacer()
                Spacer()
                Spacer()
                Text("Kentang")
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color("Abu1"))
                Text("-")
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color("Abu1"))
                Text("100")
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color("Abu1"))
                Text("Gram")
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color("Abu1"))
            }
            .frame(width: 360, height: 20)
            Divider()
        }
        Group {
            Text("REKOMENDASI PENDAMPING (Opsional)")
                .font(.caption)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color("Abu1"))
                .padding(.trailing, 115.0)
                .padding(.top, 20)
            Divider()
            HStack {
                Text("Serat")
                    .font(.body)
                    .fontWeight(.regular)
                Spacer()
                Spacer()
                Spacer()
                Text("Bayam")
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color("Abu1"))
            }
            .frame(width: 360, height: 20)
            Divider()
            HStack {
                Text("Protein Nabati")
                    .font(.body)
                    .fontWeight(.regular)
                Spacer()
                Spacer()
                Spacer()
                Text("Tempe")
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color("Abu1"))
            }
            .frame(width: 360, height: 20)
            Divider()
            HStack {
                Text("Lemak")
                    .font(.body)
                    .fontWeight(.regular)
                Spacer()
                Spacer()
                Spacer()
                Text("Minyak Zaitun")
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color("Abu1"))
            }
            .frame(width: 360, height: 20)
            Divider()
        }
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: 12)
                    .frame(width: 358.0, height: 121.0)
                    .foregroundColor(Color("Biru"))
                RoundedRectangle(cornerRadius: 12)
                    .frame(width: 355.0, height: 118.0)
                    .foregroundColor(.white)
                Text("Wow Fakta")
                    .font(.body)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("Biru"))
                    .multilineTextAlignment(.leading)
                    .padding(.trailing, 252.0)
                    .padding(.bottom, 70.0)
                Text("Bayi makan daging sapi? Mereka jadi sapi-sapi kecil berenergi, Haha!")
                    .font(.caption)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.leading)
                    .frame(width: 345.0, height: 70.0)
                    .padding(.top, 20)
            }
        }
        .toolbarBackground(Color.white, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)}
}
