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

    func dateForComponents(block: (components: NSDateComponents) -> Void) -> NSDate? {
        let calander = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let components = NSDateComponents()
        block(components: components)
        return calander?.dateByAddingComponents(components, toDate: NSDate(), options: [])
    }

    // MARK: - timeAgoSimple

    func testTimeAgoSimpleSecond() {
        let date = self.dateForComponents { components in
            components.second = -1
        }
        XCTAssertEqual(date?.timeAgoSimple, "1s")
    }

    func testTimeAgoSimpleTwoSeconds() {
        let date = self.dateForComponents { components in
            components.second = -2
        }
        XCTAssertEqual(date?.timeAgoSimple, "2s")
    }

    func testTimeAgoSimpleTenSeconds() {
        let date = self.dateForComponents { components in
            components.second = -10
        }
        XCTAssertEqual(date?.timeAgoSimple, "10s")
    }

    func testTimeAgoSimpleMinute() {
        let date = self.dateForComponents { components in
            components.minute = -1
        }
        XCTAssertEqual(date?.timeAgoSimple, "1m")
    }

    func testTimeAgoSimpleTwoMinutes() {
        let date = self.dateForComponents { components in
            components.minute = -2
        }
        XCTAssertEqual(date?.timeAgoSimple, "2m")
    }

    func testTimeAgoSimpleTenMinutes() {
        let date = self.dateForComponents { components in
            components.minute = -10
        }
        XCTAssertEqual(date?.timeAgoSimple, "10m")
    }

    func testTimeAgoSimpleHour() {
        let date = self.dateForComponents { components in
            components.hour = -1
        }
        XCTAssertEqual(date?.timeAgoSimple, "1h")
    }

    func testTimeAgoSimpleTwoHours() {
        let date = self.dateForComponents { components in
            components.hour = -2
        }
        XCTAssertEqual(date?.timeAgoSimple, "2h")
    }

    func testTimeAgoSimpleTenHours() {
        let date = self.dateForComponents { components in
            components.hour = -10
        }
        XCTAssertEqual(date?.timeAgoSimple, "10h")
    }

    func testTimeAgoSimpleDay() {
        let date = self.dateForComponents { components in
            components.day = -1
        }
        XCTAssertEqual(date?.timeAgoSimple, "1d")
    }

    func testTimeAgoSimpleTwoDays() {
        let date = self.dateForComponents { components in
            components.day = -2
        }
        XCTAssertEqual(date?.timeAgoSimple, "2d")
    }

    func testTimeAgoSimpleTenDays() {
        let date = self.dateForComponents { components in
            components.day = -10
        }
        XCTAssertEqual(date?.timeAgoSimple, "1w")
    }

    func testTimeAgoSimpleWeek() {
        let date = self.dateForComponents { components in
            components.day = -7
        }
        XCTAssertEqual(date?.timeAgoSimple, "1w")
    }

    func testTimeAgoSimpleTwoWeeks() {
        let date = self.dateForComponents { components in
            components.day = -7*2
        }
        XCTAssertEqual(date?.timeAgoSimple, "2w")
    }

    func testTimeAgoSimpleTenWeeks() {
        let date = self.dateForComponents { components in
            components.day = -7*10
        }
        XCTAssertEqual(date?.timeAgoSimple, "2mo")
    }

    func testTimeAgoSimpleMonth() {
        let date = self.dateForComponents { components in
            components.month = -1
        }
        XCTAssertEqual(date?.timeAgoSimple, "1mo")
    }

    func testTimeAgoSimpleTwoMonths() {
        let date = self.dateForComponents { components in
            components.month = -2
        }
        XCTAssertEqual(date?.timeAgoSimple, "2mo")
    }

    func testTimeAgoSimpleTenMonths() {
        let date = self.dateForComponents { components in
            components.month = -10
        }
        XCTAssertEqual(date?.timeAgoSimple, "10mo")
    }

    func testTimeAgoSimpleYear() {
        let date = self.dateForComponents { components in
            components.year = -1
        }
        XCTAssertEqual(date?.timeAgoSimple, "1yr")
    }

    func testTimeAgoSimpleTwoYears() {
        let date = self.dateForComponents { components in
            components.year = -2
        }
        XCTAssertEqual(date?.timeAgoSimple, "2yr")
    }

    func testTimeAgoSimpleTenYears() {
        let date = self.dateForComponents { components in
            components.year = -10
        }
        XCTAssertEqual(date?.timeAgoSimple, "10yr")
    }

    // MARK: - timeAgo

    func testTimeAgoSecond() {
        let date = self.dateForComponents { components in
            components.second = -1
        }
        XCTAssertEqual(date?.timeAgo, "Just now")
    }

    func testTimeAgoTwoSeconds() {
        let date = self.dateForComponents { components in
            components.second = -2
        }
        XCTAssertEqual(date?.timeAgo, "Just now")
    }

    func testTimeAgoTenSeconds() {
        let date = self.dateForComponents { components in
            components.second = -10
        }
        XCTAssertEqual(date?.timeAgo, "10 seconds ago")
    }

    func testTimeAgoMinute() {
        let date = self.dateForComponents { components in
            components.minute = -1
        }
        XCTAssertEqual(date?.timeAgo, "A minute ago")
    }

    func testTimeAgoTwoMinutes() {
        let date = self.dateForComponents { components in
            components.minute = -2
        }
        XCTAssertEqual(date?.timeAgo, "2 minutes ago")
    }

    func testTimeAgoTenMinutes() {
        let date = self.dateForComponents { components in
            components.minute = -10
        }
        XCTAssertEqual(date?.timeAgo, "10 minutes ago")
    }

    func testTimeAgoHour() {
        let date = self.dateForComponents { components in
            components.hour = -1
        }
        XCTAssertEqual(date?.timeAgo, "An hour ago")
    }

    func testTimeAgoTwoHours() {
        let date = self.dateForComponents { components in
            components.hour = -2
        }
        XCTAssertEqual(date?.timeAgo, "2 hours ago")
    }

    func testTimeAgoTenHours() {
        let date = self.dateForComponents { components in
            components.hour = -10
        }
        XCTAssertEqual(date?.timeAgo, "10 hours ago")
    }

    func testTimeAgoDay() {
        let date = self.dateForComponents { components in
            components.day = -1
        }
        XCTAssertEqual(date?.timeAgo, "Yesterday")
    }

    func testTimeAgoTwoDays() {
        let date = self.dateForComponents { components in
            components.day = -2
        }
        XCTAssertEqual(date?.timeAgo, "2 days ago")
    }

    func testTimeAgoTenDays() {
        let date = self.dateForComponents { components in
            components.day = -10
        }
        XCTAssertEqual(date?.timeAgo, "Last week")
    }

    func testTimeAgoWeek() {
        let date = self.dateForComponents { components in
            components.day = -7
        }
        XCTAssertEqual(date?.timeAgo, "Last week")
    }

    func testTimeAgoTwoWeeks() {
        let date = self.dateForComponents { components in
            components.day = -7*2
        }
        XCTAssertEqual(date?.timeAgo, "2 weeks ago")
    }

    func testTimeAgoTenWeeks() {
        let date = self.dateForComponents { components in
            components.day = -7*10
        }
        XCTAssertEqual(date?.timeAgo, "2 months ago")
    }

    func testTimeAgoMonth() {
        let date = self.dateForComponents { components in
            components.month = -1
        }
        XCTAssertEqual(date?.timeAgo, "Last month")
    }

    func testTimeAgoTwoMonths() {
        let date = self.dateForComponents { components in
            components.month = -2
        }
        XCTAssertEqual(date?.timeAgo, "2 months ago")
    }

    func testTimeAgoTenMonths() {
        let date = self.dateForComponents { components in
            components.month = -10
        }
        XCTAssertEqual(date?.timeAgo, "10 months ago")
    }

    func testTimeAgoYear() {
        let date = self.dateForComponents { components in
            components.year = -1
        }
        XCTAssertEqual(date?.timeAgo, "Last year")
    }

    func testTimeAgoTwoYears() {
        let date = self.dateForComponents { components in
            components.year = -2
        }
        XCTAssertEqual(date?.timeAgo, "2 years ago")
    }

    func testTimeAgoTenYears() {
        let date = self.dateForComponents { components in
            components.year = -10
        }
        XCTAssertEqual(date?.timeAgo, "10 years ago")
    }
    
}
