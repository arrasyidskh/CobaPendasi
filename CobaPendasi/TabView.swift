import SwiftUI

struct TabVIew: View {
    init() {
        UITabBar.appearance().backgroundColor = .white
    }
    var body: some View {
        TabView {
            Group {
                AddMenu()
                    .tabItem {
                        Label("Rencana MPASI", systemImage: "square.and.pencil")
                    }
                Riwayat()
                    .tabItem {
                        Label("Riwayat", systemImage: "clock.arrow.2.circlepath")
                    }
                    .ignoresSafeArea()
            }
        }
        .navigationBarBackButtonHidden(true)            .navigationBarTitle("", displayMode: .inline)
    }
}

struct TabVIew_Previews: PreviewProvider {
    static var previews: some View {
        TabVIew()
    }
}
