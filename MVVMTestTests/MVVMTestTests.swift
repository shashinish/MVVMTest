//
//  MVVMTestTests.swift
//  MVVMTestTests
//
//  Created by Shashi Nishantha on 11/8/19.
//  Copyright © 2019 Shashi Nishantha. All rights reserved.
//

import XCTest
@testable import MVVMTest

class MVVMTestTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testStaffViewModal(){
        let staffObj = Staff.init(id: 1, name: "Henry", title: "Associate", age: 20, avatar: "https://twistedsifter.files.wordpress.com/2012/09/trippy-profile-pic-portrait-head-on-and-from-side-angle.jpg?", hobby: "soccer, table tennis, guitar, foosball, billard, badminton, games, coding, algorithm, drinking, hangout")
        
        let staffViewModal = StaffViewModal.init(staff: staffObj)
        
        XCTAssertEqual(staffObj.name, staffViewModal.name)
        XCTAssertEqual(staffObj.hobby, staffViewModal.hobby)
    }
    
    
}
