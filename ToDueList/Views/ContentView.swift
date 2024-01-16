//
//  ContentView.swift
//  ToDueList
//
//  Created by Matthew Low on 2024-01-15.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query private var taskItems: [TaskItem]
    @State private var showingAddTask = false
    @State private var showingColorPicker = false
    @State private var color = 0
    @State private var sortOption = 0
    @State private var showingSortOptions = false
    @State var themeColor = Color.blue
    
    private var sortedTaskItems: [TaskItem] {
            switch sortOption {
            case 0:
                return sortingFunctions.sort(sortOption: 0, listOfTasks: taskItems)
            case 1:
                return sortingFunctions.sort(sortOption: 1, listOfTasks: taskItems)
            case 2:
                return sortingFunctions.sort(sortOption: 2, listOfTasks: taskItems)
            default:
                return taskItems
            }
    }
    
    let sortingFunctions = SortingFunctions()

    var body: some View {
        ZStack {
            VStack {
                HStack{
                    Spacer()
                    colorPickerView
                }
                
                headerView

                if taskItems.isEmpty {
                    emptyTaskListView
                } else {
                    taskListView
                }
            }
            .padding()

            buttonView
        }
        .sheet(isPresented: $showingAddTask) {
            AddTaskView(themeColor: themeColor, context: context)
        }
        .confirmationDialog("Sort By", isPresented: $showingSortOptions) {
            Button("Oldest to Newest Task") { sortOption = 0 }
            Button("A-Z") { sortOption = 1 }
            Button("Due Soon to Due Later") { sortOption = 2 }
        } message: {
            Text("Select sort option")
        }
    }

    private var headerView: some View {
        HStack(spacing: 0) {
            Text("To")
            Text("Due")
                .foregroundStyle(themeColor)
            Text("List")
        }
        .modifier(TitleModifier())
    }
    
    private var colorPickerView: some View{
        Menu {
            Picker("Color Options", selection: $color) {
                Text("Blue").tag(0)
                Text("Red").tag(1)
                Text("Green").tag(2)
                Text("Orange").tag(3)
                Text("Purple").tag(4)
                Text("Brown").tag(5)
            }
            .onChange(of: color) {
                switch color {
                case 0:
                    themeColor = Color.blue
                case 1:
                    themeColor = Color.red
                case 2:
                    themeColor = Color.green
                case 3:
                    themeColor = Color.orange
                case 4:
                    themeColor = Color.purple
                case 5:
                    themeColor = Color.brown
                default:
                    break
                }
            }
            
        }
        label: {
            Label("Theme", systemImage: "paintbrush.fill")
                .foregroundStyle(themeColor)
        }
    }

    private var emptyTaskListView: some View {
        VStack{
            Spacer()
            Text("Add a new task!")
                .italic()
                .foregroundStyle(Color.gray)
                .font(Font.system(size: 40))
            Spacer()
        }
      
    }

    private var taskListView: some View {
        ScrollView {
            VStack {
                ForEach(sortedTaskItems) { taskItem in
                    TaskItemView(taskItem: taskItem, themeColor: themeColor, taskItems: taskItems, context: context)
                }
            }
        }
    }

    private var buttonView: some View {
        HStack {
            VStack {
                Spacer()
                Button {
                    showingSortOptions = true
                } label: {
                    Image(systemName: "arrow.up.arrow.down")
                        .frame(width: 55, height: 55)
                        .foregroundStyle(Color.white)
                        .background(themeColor)
                        .cornerRadius(15)
                        .padding()
                }
            }
            Spacer()
            VStack {
                Spacer()
                Button {
                    showingAddTask = true
                } label: {
                    Image(systemName: "plus")
                        .frame(width: 55, height: 55)
                        .foregroundStyle(Color.white)
                        .background(themeColor)
                        .cornerRadius(15)
                        .padding()
                }
            }
        }
    }
}




#Preview {
    ContentView()
}
