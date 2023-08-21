import SwiftUI

struct BeritahuRespon: View {
    @State var stringOfTextfield: String = String()
    var body: some View {
        Group {
            NavigationStack {
                ZStack {
                    Color("Abu")
                        .ignoresSafeArea()
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            Group {
                                HStack {
                                    Text("22 Maret 2024")
                                        .font(.callout)
                                        .fontWeight(.regular)
                                    Text("Sarapan")
                                        .font(.callout)
                                        .fontWeight(.regular)
                                }
                            }
                            .padding(/*@START_MENU_TOKEN@*/.top, 3.0/*@END_MENU_TOKEN@*/)
                            Group {
                                HStack {
                                    Text("Daging")
                                        .font(.callout)
                                        .fontWeight(.bold)
                                    Text("+")
                                        .font(.callout)
                                        .fontWeight(.bold)
                                    Text("Kentang")
                                        .font(.callout)
                                        .fontWeight(.bold)
                                }
                            }
                            .padding(/*@START_MENU_TOKEN@*/.top, 3.0/*@END_MENU_TOKEN@*/)
                            Group {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 30)
                                        .frame(width: 197.0, height: 66.0)
                                        .foregroundColor(Color("Biru"))
                                    HStack {
                                        Image("Daging")
                                            .resizable()
                                            .frame(width: 50.0, height: 50.0)
                                        Image("Kentang")
                                            .resizable()
                                            .frame(width: 50.0, height: 50.0)
                                    }
                                }
                            }
                            .padding(/*@START_MENU_TOKEN@*/.top, 14.0/*@END_MENU_TOKEN@*/)
                            HStack {
                                Text("Reaksi")
                                    .font(.caption)
                                    .fontWeight(.regular)
                                    .padding(.trailing, -5.0)
                            }
                            .padding(.top, 24.0)
                            .padding(.bottom, -13.0)
                            Group {
                                HStack {
                                    Button {
                                    } label: {
                                        Image("Tidakalergidansuka")
                                            .resizable()
                                            .frame(width: 112.0, height: 83.0)
                                    }
                                    Button {
                                    } label: {
                                        Image("Tidakalergitetapitidaksuka")
                                            .resizable()
                                            .frame(width: 112.0, height: 83.0)
                                    }
                                    Button {
                                    } label: {
                                        Image("Alergipadamakananini")
                                            .resizable()
                                            .resizable()
                                            .frame(width: 112.0, height: 83.0)
                                    }
                                }
                            }
                            .padding(/*@START_MENU_TOKEN@*/.top, 14.0/*@END_MENU_TOKEN@*/)
                            TextField("Coba Ceritakan (Opsional)", text: $stringOfTextfield)
                                .padding()
                                .overlay(RoundedRectangle(cornerRadius: 5.0).strokeBorder(Color.gray))
                                .frame(width: 351.0, height: 93.0)
                            Button {
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .frame(width: 358.0, height: 58.0)
                                        .foregroundColor(Color("Kuning"))
                                        .shadow(radius: 5)
                                    Text("Simpan")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                            }
                            .toolbarBackground(Color.white, for: .navigationBar)
                            .toolbarBackground(.visible, for: .navigationBar)
                        }
                        .padding(.all, 8.0)
                    }
                    .navigationTitle("Beritahu Respon")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }
}

struct BeritahuRespon_Previews: PreviewProvider {
    static var previews: some View {
        BeritahuRespon()
    }
}
