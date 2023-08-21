import SwiftUI

struct AddMenu: View {
    @Environment(\.managedObjectContext) var moc
    @State private var menuGroups: [MenuGroup] = []
    @State private var selectedMenu: Menu?
    @State private var isGantiMenuViewPresented = false
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
        Protein(name: "Keju", imageName: "Keju")
    ]
    let carbohidrats: [Carbohydrate] = [
        Carbohydrate(name: "Nasi", imageName: "nasi"),
        Carbohydrate(name: "Kentang", imageName: "kentang"),
        Carbohydrate(name: "Pasta", imageName: "pasta"),
        Carbohydrate(name: "Jagung", imageName: "jagung")
    ]
    let sideDishes = ["Brokoli", "Wortel", "Bayam", "Kacang Merah", "Tahu", "Tempe", "Buncis"]
    var body: some View {
        NavigationView { Form {
            Section(header: Text("Menus")) {
                ForEach(menuGroups, id: \.id) { menuGroup in
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text(menuGroup.date)
                                .font(.headline)
                            Spacer()
                            Button {
                                isGantiMenuViewPresented = true
                            } label: {
                                Text("Ganti Menu")
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .background(Color("Biru"))
                                    .cornerRadius(10)
                            }
                            .sheet(isPresented: $isGantiMenuViewPresented) {
                                GantiMenuView()
                            }
                        }
                        ForEach(menuGroup.menus, id: \.id) { menu in
                            Card(menu: menu)
                                .onTapGesture {
                                    selectedMenu = menu
                                }
                        }
                    }
                }
            }
        }
        .navigationBarTitle("Rencana Mingguan")
        .sheet(item: $selectedMenu) { menu in
            Detail(menu: menu)
        }
        }
        .onAppear {
            generateRandomMenus()
        }
    }
    func generateRandomMenus() {
        menuGroups = []
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, dd/MM/yyyy"
        let startDate = Date()
        let calendar = Calendar.current
        for day in 0..<7 {
            if let currentDate = calendar.date(byAdding: .day, value: day, to: startDate) {
                let menuGroup = MenuGroup(
                    id: UUID(),
                    date: dateFormatter.string(from: currentDate),
                    menus: generateMenus())
                menuGroups.append(menuGroup)
            }
        }
    }
    func generateMenus() -> [Menu] {
        var menus: [Menu] = []
        for dailyMenus in 0..<3 {
            let protein = getProtein(forDay: dailyMenus)
            let carbohidrat = getCarbohydrate()
            _ = sideDishes.randomElement() ?? ""
            let menu = Menu(
                id: dailyMenus,
                name: "\(protein.name) + \(carbohidrat.name)",
                proteinImageName: protein.imageName,
                carbohydrateImageName: carbohidrat.imageName
            )
            menus.append(menu)
        }
        return menus
    }
    /// <#Description#>
    /// - Parameter day: <#day description#>
    /// - Returns: <#description#>
    func getProtein(forDay day: Int) -> Protein {
        let proteinIndex = day % proteins.count
        return proteins[proteinIndex]
    }
    func getCarbohydrate() -> Carbohydrate {
        let carbohydrateIndex = Int.random(in: 0..<carbohidrats.count)
        return carbohidrats[carbohydrateIndex]
    }
    struct Card: View {
        let menu: Menu
        var body: some View {
            VStack(alignment: .leading, spacing: 10) {
                Text(getMealTime())
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)
                HStack {
                    Image(menu.proteinImageName)
                        .resizable()
                        .frame(width: 100, height: 100)
                    Image(menu.carbohydrateImageName)
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                Text(menu.name)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .padding()
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.accentColor, lineWidth: 2)
            )
            .padding()
            .frame(maxWidth: .infinity)
        }
        func getMealTime() -> String {
            let menuIndex = menu.id
            switch menuIndex % 3 {
            case 0:
                return "Sarapan"
            case 1:
                return "Makan Siang"
            default:
                return "Makan Malam"
            }
        }
    }
    struct Menu: Identifiable {
        let id: Int
        let name: String
        let proteinImageName: String
        let carbohydrateImageName: String
    }
    struct MenuGroup: Identifiable {
        let id: UUID
        let date: String
        let menus: [Menu]
    }
    struct Protein: Identifiable {
        let id = UUID()
        let name: String
        let imageName: String
    }
    struct Carbohydrate: Identifiable {
        let id = UUID()
        let name: String
        let imageName: String
    }
}

struct AddMenu_Previews: PreviewProvider {
    static var previews: some View {
        AddMenu()
    }
}

struct GantiMenu: View {
    var body: some View {
        Text("Ganti Menu View")
    }
}
