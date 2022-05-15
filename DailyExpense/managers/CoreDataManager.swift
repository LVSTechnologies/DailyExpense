//
//  CoreDataManager.swift
//  DailyExpense
//
//  Created by Snehi Yavanam on 5/14/22.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistenceContainer: NSPersistentContainer
    
    static let shared = CoreDataManager()
    
    //let managedObject: NSManagedObject
    
    private init() {
        persistenceContainer = NSPersistentContainer(name: "ExpenseModel")
        persistenceContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Unable to load Core Data database")
            }
        }
        //managedObject = NSManagedObject(context: NSManagedObjectContext(NSString))
    }
}
