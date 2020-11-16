//
//  TodoFolderViewModel.swift
//  Curatio-Todo
//
//  Created by Ashwani Kumar on 2020-11-11.
//

import Foundation
import Combine

class TodoFolderViewModel: ObservableObject {
  @Published var todoFolderViewModels = [FolderCellViewModel]()
  
  private var cancellables = Set<AnyCancellable>()
  
  init() {
    todoFolderViewModels = todoData.map { item in
        FolderCellViewModel(folder: item.key)
    }
  }
  
  func addTask(folder: Folder1) {
    todoFolderViewModels.append(FolderCellViewModel(folder: folder))
    todoData[folder] = [TodoItem(title:"", completed:false)]
  }
}
