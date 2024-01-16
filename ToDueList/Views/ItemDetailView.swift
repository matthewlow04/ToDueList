//
//  ItemDetailView.swift
//  ToDueList
//
//  Created by Matthew Low on 2024-01-15.
//

import SwiftUI
import SwiftData

struct ItemDetailView: View {
    var themeColor: Color
    var taskItem: TaskItem
    var taskItems: [TaskItem]
    var context: ModelContext
    
    let sortingFunctions = SortingFunctions()
    
    var body: some View {
        VStack(spacing: 10){
            Text(taskItem.name)
                .font(Font.system(size: 20, weight: .semibold))
            Text(taskItem.desc)
            Text("Date created: " + taskItem.date.formatted(date: .numeric, time: .omitted))
            Text(taskItem.goalDate == nil ? "No goal date" : "Target Date:  \(taskItem.goalDate!.formatted(date: .numeric, time: .omitted))")
            trashButton
            
            
        }
        .frame(minWidth: 200, minHeight: 200)
        .font(Font.subheadline)
        .padding()
        
        
    }
    var trashButton: some View{
        Button{
            let index = sortingFunctions.findIndex(taskItem, listOfTasks: taskItems)
            context.delete(taskItems[index])
            
        } label: {
            HStack {
                Image(systemName: "trash.fill")
                Text("Delete Task")
            }
            .foregroundColor(.white)
            .font(.system(size: 16, weight: .semibold))
            .frame(maxWidth: .infinity, minHeight: 52)
            .background(Color.red)
            .cornerRadius(15)
            .padding(.horizontal)
            
        }
    }
    
    var checkButton: some View{
        Button{
            
        } label: {
            HStack {
                Image(systemName: "checkmark.square.fill")
                Text("Complete Task")
            }
            .foregroundColor(.white)
            .font(.system(size: 16, weight: .semibold))
            .frame(maxWidth: .infinity, minHeight: 52)
            .background(Color.green)
            .cornerRadius(15)
            .padding(.horizontal)
            
        }
    }
}

//#Preview {
//    ItemDetailView()
//}
