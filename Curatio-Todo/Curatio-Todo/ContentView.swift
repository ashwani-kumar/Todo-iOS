//
//  ContentView.swift
//  Curatio-Todo
//
//  Created by Ashwani Kumar on 2020-11-10.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var todoFolderVM = TodoFolderViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(todoFolderVM.todoFolderViewModels){ key in
                    NavigationLink(destination: TodoListView(folder: key.folder)) {
                        FolderCell(folderCellVM: key)
                    }
                }
            }
            .toolbar {
              ToolbarItem(placement: .automatic) {
                Button(action: {todoFolderVM.addTask(folder: Folder1(name:"New Folder"))}) {
                HStack {
                  Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                  Text("Add")
                }
              }
            }
        }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

struct FolderCell: View { 
  @ObservedObject var folderCellVM: FolderCellViewModel
  var onCommit: (Result<Folder1, FolderInputError>) -> Void = { _ in }
  
  var body: some View {
    HStack {
        TextField("Enter folder name", text: $folderCellVM.folder.name,
          onCommit: {
            if !self.folderCellVM.folder.name.isEmpty {
              self.onCommit(.success(self.folderCellVM.folder))
            }
            else {
              self.onCommit(.failure(.empty))
            }
        }).id(folderCellVM.id)
    }
  }
}

enum FolderInputError: Error {
  case empty
}

