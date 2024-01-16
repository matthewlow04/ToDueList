//
//  AddTaskView.swift
//  ToDueList
//
//  Created by Matthew Low on 2024-01-15.
//

import SwiftUI
import SwiftData

struct AddTaskView: View {
    @State var taskName = ""
    @State var description = ""
    @State var goalDate = Date.now
    @State var showingAlert = false
    @State var alertMessage = ""
    @State var urgency = ""
    @State var setGoalDate = false
    @State var themeColor: Color
    @Environment(\.dismiss) var dismiss
    var context: ModelContext
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
       
        VStack(alignment: .leading){
            HStack{
                Spacer()
                Text("Add Task")
                    .modifier(TitleModifier())
                   
                Spacer()
            }
            Section{
                TextField("Enter task name", text: $taskName)
                    .padding(.vertical)
                    .opacity(0.5)
            }header: {
                Text("Task Name")

            }
            
            Section{
                TextField("Enter a short description", text: $description)
                    .padding(.vertical)
                    .opacity(0.5)
            }header: {
                Text("Description")

            }
            
            Section{
                VStack(alignment: .center){
                    HStack{
                        if(setGoalDate){
                            Spacer()
                            DatePicker("Goal Date", selection: $goalDate, in: Date.now..., displayedComponents: [.date])
                                   .datePickerStyle(WheelDatePickerStyle())
                                   .labelsHidden()
                            Spacer()
                        }
                       
                    }
                    HStack{
                        Spacer()
                        Button{
                            setGoalDate.toggle()
                        } label: {
                            Text(!setGoalDate ? "Set Target Date" : "No Target Date")
                              .foregroundColor(.white)
                              .font(.system(size: 16, weight: .semibold))
                              .padding(.horizontal, 15)
                              .padding(.vertical, 5)
                              .background(themeColor)
                              .cornerRadius(15)
                        }
                        Spacer()
                    }
                }
                .padding(.vertical)

            }header:{
                Text("Select Goal Date")
            }
            
            
            Section{
                LazyVGrid(columns: columns, content: {
                    ForEach(TaskItem.Urgency.allCases, id: \.self){ urg in
                        Button(urg.rawValue.capitalized){
                            urgency = urg.rawValue
                        }
                        .foregroundStyle(urgency == urg.rawValue ? themeColor : Color.gray)
                        .padding(.vertical)
                    }
                    
                })
            }header: {
                Text("Urgency")
            }
            
            Button{
                
                if(taskName.isEmpty){
                    alertMessage = "Task Name Can't Be Empty"
                    showingAlert = true
                    return
                }
                
                if(setGoalDate == false){
                    context.insert(TaskItem(name: taskName, urgency: TaskItem.Urgency(rawValue: urgency) ?? .low, description: description))
                }
                else{
                    context.insert(TaskItem(name: taskName, urgency: TaskItem.Urgency(rawValue: urgency) ?? .low, description: description, goalDate: goalDate) )
                }
                
                alertMessage = "Task Added to To Do List"
                showingAlert = true
                print(goalDate)
                print(setGoalDate)
               
                
            } label: {
                HStack {
                    Image(systemName: "list.clipboard.fill")
                    Text("Add Task")
                }
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .semibold))
                .frame(maxWidth: .infinity, minHeight: 52)
                .background(themeColor)
                .cornerRadius(15)
                
            }
            
            Spacer()
        }
        
        .alert(alertMessage, isPresented: $showingAlert, actions: {
            Button("OK", role: .cancel){
                dismiss()
            }
        })
        .padding(30)
        .fontDesign(.rounded)
    }
}

//#Preview {
//    AddTaskView()
//}
