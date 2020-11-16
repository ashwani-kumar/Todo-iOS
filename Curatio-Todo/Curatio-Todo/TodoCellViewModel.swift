//
//  ViewModel.swift
//  Curatio-Todo
//
//  Created by Ashwani Kumar on 2020-11-11.
//

import Foundation
import Combine

class TodoCellViewModel: ObservableObject, Identifiable  {
  @Published var task: TodoItem
  @Published var folder: Folder1
    
  var id: String = ""
  @Published var completionStateIconName = ""
  
  private var cancellables = Set<AnyCancellable>()
  
    static func newTask(folder: Folder1) -> TodoCellViewModel {
        TodoCellViewModel(task: TodoItem(title: "", completed: false), folder:folder)
  }
  
  func updateTask() {
    todoData.updateValue([task], forKey: folder)
  }
  
  init(task: TodoItem, folder: Folder1) {
    self.task = task
    self.folder = folder
    
    $task
      .map { $0.completed ? "checkmark.circle.fill" : "circle" }
      .assign(to: \.completionStateIconName, on: self)
      .store(in: &cancellables)

    $task
      .map { $0.id }
      .assign(to: \.id, on: self)
      .store(in: &cancellables)

  }
  
}


