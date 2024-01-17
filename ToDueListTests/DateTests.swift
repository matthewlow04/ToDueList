//
//  DateTests.swift
//  ToDueListTests
//
//  Created by Matthew Low on 2024-01-15.
//

import XCTest
@testable import ToDueList

final class DateTests: XCTestCase {
    
    var testDate: Date!
    var referenceDate: Date!
    var rawDateComponents: DateComponents!
    var rawDate: Date!


    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        testDate = nil
        referenceDate = nil
        rawDate = nil
        rawDateComponents = nil
    }
    
    func testDateMessage(){
        
        referenceDate = setDate(month: 01, day: 01, year: 2024)
      
        // Test case 1: Date is today
        XCTAssertEqual(timeLeft(date: referenceDate, dateNow: referenceDate), "Complete by today")

        // Test case 2: Date is tomorrow (86400 seconds)
        testDate = referenceDate.addingTimeInterval(86400)
        XCTAssertEqual(timeLeft(date: testDate, dateNow: referenceDate), "Complete by tomorrow")

        // Test case 3: Test is x days in the future (3)
        testDate = referenceDate.addingTimeInterval(3 * 86400)
        XCTAssertEqual(timeLeft(date: testDate, dateNow: referenceDate), "Complete in 3 days")
    }
    
    func testSetDate(){
        
        //Test my setDate function
        rawDateComponents = DateComponents(year: 2004, month: 10, day: 10)
        rawDate = Calendar.current.date(from: rawDateComponents)!
        XCTAssertEqual(setDate(month: 10, day: 10, year: 2004), rawDate)
    }

}
