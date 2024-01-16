//
//  TaskItemView.swift
//  ToDueList
//
//  Created by Matthew Low on 2024-01-15.
//

import SwiftUI
import SwiftData

struct TaskItemView: View {
    
    var taskItem: TaskItem
    var themeColor: Color
    var taskItems: [TaskItem]
    var context: ModelContext
    @State var showingItemDetails = false
  
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10){
                Button(taskItem.name){
                    showingItemDetails = true
                }
                    .font(Font.system(size: 20, weight: .semibold, design: .rounded))
                    .foregroundStyle(themeColor)
                    .foregroundStyle(themeColor)
                if(taskItem.goalDate != nil){
                    Text(timeLeft(date: taskItem.goalDate!))
                }else{
                    Text("No Target Date")
                }
             
            }
            
            Spacer()
            
            Button {
                showingItemDetails = true
            } label: {
                Image(systemName: "pencil.line")
                    .foregroundStyle(themeColor)
            }
            .frame(width:30, height: 30)

        }
        .padding(10)
        .clipShape(Capsule())
        .border(themeColor, width: 2)
        .background(Color.gray.opacity(0.10))
        .popover(isPresented: $showingItemDetails) {
            ItemDetailView(themeColor: themeColor, taskItem: taskItem, taskItems: taskItems, context: context)
                .presentationCompactAdaptation(.popover)
        }
    }
}

//#Preview {
//    TaskItemView()
//}
