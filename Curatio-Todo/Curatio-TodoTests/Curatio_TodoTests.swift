//
//  Curatio_TodoTests.swift
//  Curatio-TodoTests
//
//  Created by Ashwani Kumar on 2020-11-10.
//

import XCTest
@testable import Curatio_Todo

class Curatio_TodoTests: XCTestCase {

    var vm: TodoFolderViewModel?
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        vm = TodoFolderViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        vm = nil
    }

    func testAddFolder() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let folder = Folder1(name: "New Folder")
        vm?.addTask(folder: folder)
        XCTAssert(vm?.todoFolderViewModels.count == 2)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
