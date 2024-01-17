//
//  SortTests.swift
//  ToDueListTests
//
//  Created by Matthew Low on 2024-01-16.
//

import XCTest
@testable import ToDueList

final class SortTests: XCTestCase {
    
    var sortingFunctions: SortingFunctions!
    var task1: TaskItem!
    var task2: TaskItem!
    var task3: TaskItem!
    var listOfTasks: [TaskItem]!
    var sortedTasks: [TaskItem]!
    
    override func setUpWithError() throws {
    
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        task1 = nil
        task2 = nil
        task3 = nil
        listOfTasks = nil
        sortedTasks = nil
        sortingFunctions = nil
    }

    
    func testFindIndex() {
        sortingFunctions = SortingFunctions()
        task1 = TaskItem(name: "Task 1", urgency: .low, description: "Description 1")
        task2 = TaskItem(name: "Task 2", urgency: .medium, description: "Description 2")
        task3 = TaskItem(name: "Task 3", urgency: .high, description: "Description 3")
        
        listOfTasks = [task1, task2, task3]
        
        XCTAssertEqual(sortingFunctions.findIndex(task1, listOfTasks: listOfTasks), 0)
        XCTAssertEqual(sortingFunctions.findIndex(task2, listOfTasks: listOfTasks), 1)
        XCTAssertEqual(sortingFunctions.findIndex(task3, listOfTasks: listOfTasks), 2)
    }
    
    func testSortByDate() {
        sortingFunctions = SortingFunctions()
        task1 = TaskItem(name: "Task 1", urgency: .low, description: "Description 1")
        task2 = TaskItem(name: "Task 2", urgency: .medium, description: "Description 2")
        task3 = TaskItem(name: "Task 3", urgency: .high, description: "Description 3")
        
        listOfTasks = [task1, task2, task3]
        
        sortedTasks = sortingFunctions.sort(sortOption: 0, listOfTasks: listOfTasks)
        
        XCTAssertEqual(sortedTasks, [task1, task2, task3])
    }
    
    func testSortByName() {
        sortingFunctions = SortingFunctions()
        task1 = TaskItem(name: "Task A", urgency: .low, description: "Description A")
        task2 = TaskItem(name: "Task C", urgency: .medium, description: "Description C")
        task3 = TaskItem(name: "Task B", urgency: .high, description: "Description B")
        
        listOfTasks = [task1, task2, task3]
        
        sortedTasks = sortingFunctions.sort(sortOption: 1, listOfTasks: listOfTasks)
        
        XCTAssertEqual(sortedTasks, [task1, task3, task2])
    }
    
    func testSortByGoalDate() {
        sortingFunctions = SortingFunctions()
        task1 = TaskItem(name: "Task 1", urgency: .low, description: "Description 1", goalDate: Date().addingTimeInterval(3600))
        task2 = TaskItem(name: "Task 2", urgency: .medium, description: "Description 2", goalDate: nil)
        task3 = TaskItem(name: "Task 3", urgency: .high, description: "Description 3", goalDate: Date().addingTimeInterval(-3600))
        
        listOfTasks = [task1, task2, task3]
        
        sortedTasks = sortingFunctions.sort(sortOption: 2, listOfTasks: listOfTasks)
        
        XCTAssertEqual(sortedTasks, [task3, task1, task2])
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
