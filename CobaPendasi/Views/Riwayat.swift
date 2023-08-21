import SwiftUI

struct Riwayat: View {
    @State private var searchText = ""
    @State private var showNotifications = false
    var body: some View {
        NavigationView {
            ZStack {
                Color("Abu")
                    .ignoresSafeArea()
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        Group {
                            NavigationLink(destination: DetailRiwayat()) {
                                HStack {
                                    Text("Daging")
                                        .font(.body)
                                        .fontWeight(.regular)
                                        .foregroundColor(.black)
                                    Text("+")
                                        .font(.body)
                                        .fontWeight(.regular)
                                        .padding()
                                        .foregroundColor(.black)
                                    Text("Kentang")
                                        .font(.body)
                                        .fontWeight(.regular)
                                        .padding(.trailing, 40)
                                        .foregroundColor(.black)
                                    Text("😍")
                                    Text("10")
                                        .font(.body)
                                        .fontWeight(.regular)
                                        .foregroundColor(.black)
                                    Text("😣")
                                    Text("2")
                                        .font(.body)
                                        .fontWeight(.regular)
                                        .foregroundColor(.black)
                                    Text("🤮")
                                    Text("1")
                                        .font(.body)
                                        .fontWeight(.regular)
                                        .foregroundColor(.black)
                                }
                            }
                            Divider()
                        }
                    }
                }
                .padding(.all, 8.0)
                .toolbarBackground(Color.white, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
            }
            .navigationTitle("Riwayat MPASI")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText, prompt: "Cari kata...")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: Pemberitahuan()) {
                        Image(systemName: "bell")
                            .foregroundColor(.primary)
                    }
                }
            }
        }
    }
}

struct Riwayat_Previews: PreviewProvider {
    static var previews: some View {
        Riwayat()
    }
}
