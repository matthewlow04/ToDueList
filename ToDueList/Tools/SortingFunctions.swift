//
//  SortingFunctions.swift
//  ToDueList
//
//  Created by Matthew Low on 2024-01-15.
//

import Foundation

class SortingFunctions{
    func findIndex(_ taskItem: TaskItem, listOfTasks: [TaskItem]) -> Int{
        
        return listOfTasks.firstIndex{$0.id == taskItem.id}!
    }
    func sort(sortOption: Int, listOfTasks: [TaskItem]) -> [TaskItem]{
        var sortedTasks: [TaskItem]

        if(sortOption == 0){
            sortedTasks = listOfTasks.sorted{$0.date < $1.date}
        }else if(sortOption == 1){
            sortedTasks = listOfTasks.sorted{$0.name < $1.name}
        }else{
            sortedTasks = listOfTasks.sorted{ (task1, task2) in
                switch (task1.goalDate, task2.goalDate) {
                case (nil, nil):
                    return false
                case (nil, _):
                    return false
                case (_, nil):
                    return true
                case let (date1?, date2?):
                    return date1 < date2
                }
            }
        }
        
        return sortedTasks
    }
}
