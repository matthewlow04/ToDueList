//
//  TaskItem.swift
//  ToDueList
//
//  Created by Matthew Low on 2024-01-15.
//

import Foundation
import SwiftData



@Model
class TaskItem: Identifiable{
    
    var id: String
    var name: String
    var desc: String
    var urgency: Urgency
    var date: Date
    var goalDate: Date?
    
    enum Urgency: String, CaseIterable, Codable{
        case low = "low"
        case medium = "medium"
        case high = "high"
    }
    
  
    
    init(name: String, urgency: Urgency, description: String, goalDate: Date? = nil){
        self.id = UUID().uuidString
        self.name = name
        self.urgency = urgency
        self.date = Date.now
        self.desc = description
        self.goalDate = goalDate
    }
    
}


