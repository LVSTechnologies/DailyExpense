//
//  ExpenseItem.swift
//  DailyExpense
//
//  Created by Snehi Yavanam on 5/14/22.
//

import Foundation

struct ExpenseItem: Identifiable {
    
    let expenseEntity: ExpenseEntity
    
    init(expenseEntity: ExpenseEntity) {
        self.expenseEntity = expenseEntity
    }
    
    var id: Int64 {
        expenseEntity.id
    }
    var title: String {
        expenseEntity.title ?? ""
    }
    
    var amount: Double {
        expenseEntity.amount
    }
}
