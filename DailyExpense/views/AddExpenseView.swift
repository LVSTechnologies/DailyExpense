//
//  AddExpenseView.swift
//  DailyExpense
//
//  Created by Snehi Yavanam on 5/14/22.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var title = ""
    @State var amount = ""
    @StateObject var viewModel = ExpenseListViewModel()
    var viewContext = CoreDataManager.shared.persistenceContainer.viewContext
    var body: some View {
        VStack {
            
            
            Label("Add an Expense", systemImage: "plus.circle")
                .font(.headline)
            
            TextField("Enter Title", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Enter Amount", text: $amount)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            HStack {
            
                Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }.frame(width: 150, height: 50)
                    .background(Color.secondary)
                    .foregroundColor(.black)
                    .cornerRadius(8)
                    .padding()
            
            Button("Save Expense") {
                
                let expenseItems = viewModel.expenseItems
                let expenseEntity = ExpenseEntity(context: viewContext)
                expenseEntity.id = Int64(expenseItems.count + 1)
                expenseEntity.title = title
                expenseEntity.amount = Double(amount)!
                
                if viewContext.hasChanges {
                    do {
                        try viewContext.save()
                        
                    } catch {
                        print("Error adding entity \(error.localizedDescription) ")
                    }
                }
                
                presentationMode.wrappedValue.dismiss()
            }
            .frame(width: 150, height: 50)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding()
          }
        }
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView()
    }
}
