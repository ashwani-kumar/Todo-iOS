//
//  Y.swift
//  Curatio-Todo
//
//  Created by Ashwani Kumar on 2020-11-10.
//

import SwiftUI

struct TodoListView: View {

  var folder: Folder1
  @ObservedObject var taskListVM = TodoListViewModel()
  @State var presentAddNewItem = false
  @State var presentUpdateItem = false
    
  var body: some View {
    NavigationView { // (2)
      VStack(alignment: .leading) {
        List {
            ForEach (taskListVM.taskCellViewModels) { todoCellViewModel in
                TodoCell(taskCellVM: todoCellViewModel)
          }
          .onDelete { indexSet in
            self.taskListVM.removeTasks(atOffsets: indexSet)
          }
          if presentAddNewItem {
            TodoCell(taskCellVM: TodoCellViewModel.newTask(folder: folder)) { result in
              if case .success(let task) = result {
                self.taskListVM.addTask(task: task)
              }
              self.presentAddNewItem.toggle()
            }
          }
        }
        Button(action: {self.presentAddNewItem.toggle()}) {
          HStack {
            Image(systemName: "plus.circle.fill")
              .resizable()
              .frame(width: 20, height: 20)
            Text("Add Todo")
          }
        }
        .padding()
        .accentColor(Color(UIColor.systemRed))
      }
      .navigationBarTitle("Todo's")
    }
    .onAppear {
        taskListVM.setFolder(folder: folder)
    }
  }
}



struct TodoListView_Previews: PreviewProvider {
  static var previews: some View {
    TodoListView(folder: Folder1(name: "Grocery List"), taskListVM: TodoListViewModel())
  }
}

struct TodoCell: View { 
  @ObservedObject var taskCellVM: TodoCellViewModel
  var onCommit: (Result<TodoItem, InputError>) -> Void = { _ in }
  
  var body: some View {
    HStack {
      Image(systemName: taskCellVM.completionStateIconName)
        .resizable()
        .frame(width: 20, height: 20)
        .onTapGesture {
            self.taskCellVM.task.completed.toggle()
            self.taskCellVM.updateTask()
        }
        TextField("Enter task title", text: $taskCellVM.task.title,
          onCommit: {
            if !self.taskCellVM.task.title.isEmpty {
              self.onCommit(.success(self.taskCellVM.task))
                self.taskCellVM.updateTask()
            }
            else {
              self.onCommit(.failure(.empty))
            }
        }).id(taskCellVM.id)
    }
  }
}

enum InputError: Error {
  case empty
}
