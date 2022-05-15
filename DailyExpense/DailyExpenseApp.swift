//
//  DailyExpenseApp.swift
//  DailyExpense
//
//  Created by Snehi Yavanam on 5/14/22.
//

import SwiftUI
import CoreData

@main
struct DailyExpenseApp: App {
    let viewContext: NSManagedObjectContext = CoreDataManager.shared.persistenceContainer.viewContext
    var body: some Scene {
        WindowGroup {
            ExpenseListView().environment(\.managedObjectContext, viewContext)
        }
    }
}
