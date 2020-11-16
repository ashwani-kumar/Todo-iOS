//
//  FolderCellViewModel.swift
//  Curatio-Todo
//
//  Created by Ashwani Kumar on 2020-11-11.
//

import Foundation
import Combine

class FolderCellViewModel: ObservableObject, Identifiable  {
  @Published var folder: Folder1
  
  var name: String = ""
  
  private var cancellables = Set<AnyCancellable>()
  
  static func newFolder() -> FolderCellViewModel {
    FolderCellViewModel(folder: Folder1(name: ""))
  }
  
  init(folder: Folder1) {
    self.folder = folder
  }
  
}
