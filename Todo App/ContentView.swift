//
//  ContentView.swift
//  Todo App
//
//  Created by Palatip Jantawong on 17/12/2566 BE.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var todoList: TodoList = TodoList()
    
    
    var body: some View {
        NavigationStack {
            VStack{
                List{
                    ForEach(todoList.todos, id: \.self) { todo in
                        HStack{
                            Text(todo.task)
                            Spacer()
                            Image(systemName: "trash")
                                .foregroundStyle(.red)
                                .onTapGesture {
                                    todoList.DeleteTodo(todo: todo)
                                }

                        }
                    }
                }
            }.navigationTitle("Todo")
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            todoList.showAddTodoView.toggle()
                        }, label: {
                            Text("Add Todo")
                        })
                    }
                }
                .sheet(isPresented: $todoList.showAddTodoView, content: {
                    AddTodoView(todoList: todoList)
                })
        }
    }
}

struct Todo: Identifiable, Equatable, Hashable {
    var id = UUID()
    var task : String
}

class TodoList: ObservableObject{
    @Published var todos: [Todo] = []
    @Published var showAddTodoView = false
    
    func AddTodo(task: String) {
        todos.append(Todo(task: task))
    }
    
    func DeleteTodo(todo: Todo) {
        if let index = todos.firstIndex(of: todo){
            todos.remove(at: index)
        }
    }
}
#Preview {
    ContentView()
}
