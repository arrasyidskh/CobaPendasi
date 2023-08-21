import SwiftUI

struct Pemberitahuan: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isShowingModal = false
    var body: some View {
        ZStack {
            Color("Abu")
                .ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
                Group {
                    VStack {
                        Group {
                            VStack {
                                HStack {
                                    Text("22")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                    Text("Maret")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                    Text("2024")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                    Text(":")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                    Text("Sarapan")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                }
                                .padding(.trailing, 185.0)
                                Text("Beritahu respon anak anda agar menu yang direkomendasikan lebih sesuai")
                                    .font(.caption)
                                    .fontWeight(.regular)
                                    .foregroundColor(Color("Abu1"))
                            }
                            .onTapGesture {
                                isShowingModal = true
                            }
                        }
                        Divider()
                            .padding(.bottom, 600)
                    }
                }
                .padding(.all, 8.0)
            }
            .toolbarBackground(Color.white, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarTitle(Text("Pemberitahuan"), displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton)
            .sheet(isPresented: $isShowingModal) {
                BeritahuRespon()
            }
        }
    }
    var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            HStack {
                Image(systemName: "arrow.left")
                Text("Kembali")
            }
        }
    }
}

struct Pemberitahuan_Previews: PreviewProvider {
    static var previews: some View {
        Pemberitahuan()
    }
}
