//
//  TaskViewModel.swift
//  Curatio-Todo
//
//  Created by Ashwani Kumar on 2020-11-11.
//

import Foundation
import Combine

class TodoListViewModel: ObservableObject {
  @Published var taskCellViewModels = [TodoCellViewModel]()
  
  private var cancellables = Set<AnyCancellable>()
  private var folder: Folder1
  
  init() {
    self.folder = Folder1(name:"")
  }
    
  func setFolder(folder: Folder1){
    self.folder = folder
    self.taskCellViewModels = (todoData[folder]?.map { task in
        TodoCellViewModel(task: task, folder: folder)
    })!
  }
  
  func removeTasks(atOffsets indexSet: IndexSet) {
    taskCellViewModels.remove(atOffsets: indexSet)
    todoData[self.folder]?.remove(atOffsets: indexSet)
  }
  
  func addTask(task: TodoItem) {
    taskCellViewModels.append(TodoCellViewModel(task: task, folder: self.folder))
    todoData[self.folder]?.append(task)
  }
    
  func updateTask(task: TodoItem) {
    todoData.updateValue([task], forKey: folder)
  }
}
