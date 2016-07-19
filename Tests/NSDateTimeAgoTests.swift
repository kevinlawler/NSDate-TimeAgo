//
//  NSDateTimeAgoTests.swift
//  NSDateTimeAgoTests
//
//  Created by David Keegan on 10/15/15.
//  Copyright © 2015 Kevin Lawler. All rights reserved.
//

import XCTest
import NSDateTimeAgo

class NSDateTimeAgoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func dateForComponents(block: (inout components: DateComponents) -> Void) -> Date? {
        let calander = Calendar.current
        var components = DateComponents()
        block(components: &components)
        return calander.date(byAdding: components, to: Date(), options: [])
    }

    // MARK: - timeAgoSimple

    func testTimeAgoSimpleSeconds() {
        XCTAssertEqual(self.dateForComponents { $0.second = -1 }?.timeAgoSimple, "1s")
        XCTAssertEqual(self.dateForComponents { $0.second = -2 }?.timeAgoSimple, "2s")
        XCTAssertEqual(self.dateForComponents { $0.second = -10 }?.timeAgoSimple, "10s")
    }

    func testTimeAgoSimpleMinutes() {
        XCTAssertEqual(self.dateForComponents { $0.minute = -1 }?.timeAgoSimple, "1m")
        XCTAssertEqual(self.dateForComponents { $0.minute = -2 }?.timeAgoSimple, "2m")
        XCTAssertEqual(self.dateForComponents { $0.minute = -10 }?.timeAgoSimple, "10m")
    }

    func testTimeAgoSimpleHours() {
        XCTAssertEqual(self.dateForComponents { $0.hour = -1 }?.timeAgoSimple, "1h")
        XCTAssertEqual(self.dateForComponents { $0.hour = -2 }?.timeAgoSimple, "2h")
        XCTAssertEqual(self.dateForComponents { $0.hour = -10 }?.timeAgoSimple, "10h")
    }

    func testTimeAgoSimpleDays() {
        XCTAssertEqual(self.dateForComponents { $0.day = -1 }?.timeAgoSimple, "1d")
        XCTAssertEqual(self.dateForComponents { $0.day = -2 }?.timeAgoSimple, "2d")
        XCTAssertEqual(self.dateForComponents { $0.day = -10 }?.timeAgoSimple, "1w")
    }

    func testTimeAgoSimpleWeeks() {
        XCTAssertEqual(self.dateForComponents { $0.day = -7 }?.timeAgoSimple, "1w")
        XCTAssertEqual(self.dateForComponents { $0.day = -7*2 }?.timeAgoSimple, "2w")
        XCTAssertEqual(self.dateForComponents { $0.day = -7*10 }?.timeAgoSimple, "2mo")
    }

    func testTimeAgoSimpleMonths() {
        XCTAssertEqual(self.dateForComponents { $0.month = -1 }?.timeAgoSimple, "1mo")
        XCTAssertEqual(self.dateForComponents { $0.month = -2 }?.timeAgoSimple, "2mo")
        XCTAssertEqual(self.dateForComponents { $0.month = -10 }?.timeAgoSimple, "10mo")
    }

    func testTimeAgoSimpleYears() {
        XCTAssertEqual(self.dateForComponents { $0.year = -1 }?.timeAgoSimple, "1yr")
        XCTAssertEqual(self.dateForComponents { $0.year = -2 }?.timeAgoSimple, "2yr")
        XCTAssertEqual(self.dateForComponents { $0.year = -10 }?.timeAgoSimple, "10yr")
    }

    // MARK: - timeAgo

    func testTimeAgoSeconds() {
        XCTAssertEqual(self.dateForComponents { $0.second = -1 }?.timeAgo, "Just now")
        XCTAssertEqual(self.dateForComponents { $0.second = -2 }?.timeAgo, "Just now")
        XCTAssertEqual(self.dateForComponents { $0.second = -10 }?.timeAgo, "10 seconds ago")
    }

    func testTimeAgoMinutes() {
        XCTAssertEqual(self.dateForComponents { $0.minute = -1 }?.timeAgo, "A minute ago")
        XCTAssertEqual(self.dateForComponents { $0.minute = -2 }?.timeAgo, "2 minutes ago")
        XCTAssertEqual(self.dateForComponents { $0.minute = -10 }?.timeAgo, "10 minutes ago")
    }

    func testTimeAgoHours() {
        XCTAssertEqual(self.dateForComponents { $0.hour = -1 }?.timeAgo, "An hour ago")
        XCTAssertEqual(self.dateForComponents { $0.hour = -2 }?.timeAgo, "2 hours ago")
        XCTAssertEqual(self.dateForComponents { $0.hour = -10 }?.timeAgo, "10 hours ago")
    }

    func testTimeAgoDays() {
        XCTAssertEqual(self.dateForComponents { $0.day = -1 }?.timeAgo, "Yesterday")
        XCTAssertEqual(self.dateForComponents { $0.day = -2 }?.timeAgo, "2 days ago")
        XCTAssertEqual(self.dateForComponents { $0.day = -10 }?.timeAgo, "Last week")
    }

    func testTimeAgoWeeks() {
        XCTAssertEqual(self.dateForComponents { $0.day = -7 }?.timeAgo, "Last week")
        XCTAssertEqual(self.dateForComponents { $0.day = -7*2 }?.timeAgo, "2 weeks ago")
        XCTAssertEqual(self.dateForComponents { $0.day = -7*10 }?.timeAgo, "2 months ago")
    }

    func testTimeAgoMonths() {
        XCTAssertEqual(self.dateForComponents { $0.month = -1 }?.timeAgo, "Last month")
        XCTAssertEqual(self.dateForComponents { $0.month = -2 }?.timeAgo, "2 months ago")
        XCTAssertEqual(self.dateForComponents { $0.month = -10 }?.timeAgo, "10 months ago")
    }

    func testTimeAgoYears() {
        XCTAssertEqual(self.dateForComponents { $0.year = -1 }?.timeAgo, "Last year")
        XCTAssertEqual(self.dateForComponents { $0.year = -2 }?.timeAgo, "2 years ago")
        XCTAssertEqual(self.dateForComponents { $0.year = -10 }?.timeAgo, "10 years ago")
    }
    
}
