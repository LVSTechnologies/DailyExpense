//
//  ExpenseListView.swift
//  DailyExpense
//
//  Created by Snehi Yavanam on 5/14/22.
//

import SwiftUI

struct ExpenseListView: View {
    @ObservedObject var viewModel = ExpenseListViewModel()
    @State private var showAddExpenseSheet = false
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.expenseItems,id: \.id) {expenseItem in
                    NavigationLink(destination: ExpenseDetailView(expenseItem: expenseItem)) {
                        HStack {
                            Text("\(expenseItem.title)")
                            Spacer()
                            Text("$\(expenseItem.amount, specifier: "%.2f")").padding()
                        }
                    }
                }
            }
            .navigationTitle("Daily Expenses")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add Expense") {
                        showAddExpenseSheet = true
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $showAddExpenseSheet, content: {
            AddExpenseView()
        })
        .onAppear{
            viewModel.getAllItems()
        }
    }
}

struct ExpenseListView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseListView()
    }
}
