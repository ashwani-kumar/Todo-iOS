//
//  Curatio_TodoItemTest.swift
//  Curatio-TodoTests
//
//  Created by Ashwani Kumar on 2020-11-11.
//

import XCTest
@testable import Curatio_Todo

class Curatio_TodoItemTests: XCTestCase {

    var vm: TodoListViewModel?
    var vmCell: TodoCellViewModel?
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        vm = TodoListViewModel()
        vmCell = TodoCellViewModel(task: TodoItem(title: "New Folder", completed: false), folder: Folder1(name: "New Folder"))
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        vm = nil
        vmCell = nil
    }

    func testAddItem() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let item = TodoItem(title: "New Item", completed: false)
        vm?.addTask(task: item)
        XCTAssert(vm?.taskCellViewModels.count == 1)
    }
    
    func testUpdateItem() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        vmCell?.task.completed=true
        vmCell?.updateTask()
        XCTAssert(vmCell?.task.completed == true)
    }
    
    func testUpdateNameItem() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        vmCell?.task.title="Test Name"
        vmCell?.updateTask()
        XCTAssert(vmCell?.task.title == "Test Name")
    }
    
    func testRemoveItem() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        var set = IndexSet()
        set.insert(0)
        vm?.removeTasks(atOffsets: set)
        XCTAssert(vm?.taskCellViewModels.count == 0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
