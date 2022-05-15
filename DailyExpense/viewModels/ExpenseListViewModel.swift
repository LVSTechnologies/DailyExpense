//
//  ExpenseListViewModel.swift
//  DailyExpense
//
//  Created by Snehi Yavanam on 5/14/22.
//

import Foundation
import CoreData

//@MainActor
class ExpenseListViewModel: NSObject,ObservableObject {
    @Published var expenseItems: [ExpenseItem] = []
    //private (set) var container: NSPersistentContainer
    private (set) var viewContext: NSManagedObjectContext
    var expenseFetchRequest: NSFetchRequest<ExpenseEntity>
    var fetchResultsController: NSFetchedResultsController<ExpenseEntity>
    
    override init() {
        
        viewContext = CoreDataManager.shared.persistenceContainer.viewContext
        expenseFetchRequest = ExpenseEntity.fetchRequest()
        expenseFetchRequest.sortDescriptors = []
        fetchResultsController = NSFetchedResultsController(fetchRequest: expenseFetchRequest, managedObjectContext: viewContext, sectionNameKeyPath: nil, cacheName: nil)
        super.init()
        fetchResultsController.delegate = self
        
        //Now perform the fetch
        do {
            try fetchResultsController.performFetch()
            guard let expenseEntitis = fetchResultsController.fetchedObjects else {
                return
            }
        
        self.expenseItems = expenseEntitis.map(ExpenseItem.init)
            
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    
    func getAllItems() {
        //let expenseFetchRequest: NSFetchRequest<ExpenseEntity> = NSFetchRequest<ExpenseEntity>.init(entityName: "ExpenseEntity")
        expenseFetchRequest = ExpenseEntity.fetchRequest()
        
        do{
            var expenseEntities = try viewContext.fetch(expenseFetchRequest)
            self.expenseItems = expenseEntities.map{
                ExpenseItem(expenseEntity: $0)
            }
        } catch {
            print("Error on getAllItems: \(error.localizedDescription)")
        }
        
        
    }
    
    func save() {
        guard viewContext.hasChanges else {
            return
        }
        
        do{
            try viewContext.save()
            
        } catch let error {
            
        }
        
        getAllItems()
        
    }
    
    
}

extension ExpenseListViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let expenseEntities = controller.fetchedObjects as? [ExpenseEntity] else {
            return
        }
        
        self.expenseItems = expenseEntities.map(ExpenseItem.init)
    }
}
