//
//  ExpenseDetailView.swift
//  DailyExpense
//
//  Created by Snehi Yavanam on 5/14/22.
//

import SwiftUI

struct ExpenseDetailView: View {
    @State var expenseItem: ExpenseItem
    @State private var showAlert = false
    @State var title = ""
    @State var amount = ""
    private var isButtonDisabled: Bool {
        title.isEmpty || amount.isEmpty
    }
    
    
    var body: some View {
        
        VStack {
            
            Label("Update Expense Item", systemImage: "plus.circle")
                .font(.headline).padding()
            
            TextField("\(expenseItem.title)", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            
            TextField("enter amount", text: $amount)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
//            Text("\(expenseItem.title)")
//            Text("$\(expenseItem.amount, specifier: "%.2f")")
            Button("Update") {
                showAlert = true
            }
            .disabled(isButtonDisabled)
            .frame(width: 150, height: 50)
            .background(isButtonDisabled ? Color.secondary : Color.blue)
            .foregroundColor(isButtonDisabled ? Color.black : Color.white)
            .cornerRadius(8)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Update Expense Item"), message: Text("Work in progress"), dismissButton: .default(Text("Ok")))
            }
            Spacer()
            
        }
    }
}

//struct ExpenseDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExpenseDetailView(expenseItem: ExpenseItem(expenseEntity: <#T##ExpenseEntity#>))
//    }
//}
