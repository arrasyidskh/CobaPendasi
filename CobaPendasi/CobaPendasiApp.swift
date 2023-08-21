//
//  CobaPendasiApp.swift
//  CobaPendasi
//
//  Created by Apriliando Adhi Rinaldy on 10/06/23.
//

import SwiftUI

@main
struct CobaPendasiApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            Content()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
