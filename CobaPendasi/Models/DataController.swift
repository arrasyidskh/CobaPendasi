//
//  DataController.swift
//  CobaPendasi
//
//  Created by Apriliando Adhi Rinaldy on 10/06/23.

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "MpasiOption")
    init() {
        container.loadPersistentStores {_, eror in
            if let eror = eror {print("Core Data failed to Load: \(eror.localizedDescription)")
            }
        }
    }
}
