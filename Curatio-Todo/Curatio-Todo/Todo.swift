//
//  Todo.swift
//  Curatio-Todo
//
//  Created by Ashwani Kumar on 2020-11-11.
//

import Foundation

struct TodoItem: Identifiable {
  var id: String = UUID().uuidString
  var title: String
  var completed: Bool
}

struct Folder1: Hashable, Identifiable {
    var id: String = UUID().uuidString
    var name: String
}

var todoData =  [Folder1(name: "Grocery List"):testDataTasks]

let testDataTasks = [
    TodoItem(title: "Milk", completed: false),
    TodoItem(title: "Oats", completed: false),
    TodoItem(title: "Apples", completed: false),
    TodoItem(title: "Candies", completed: false)
]
