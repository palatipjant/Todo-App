//
//  AddTodoView.swift
//  Todo App
//
//  Created by Palatip Jantawong on 18/12/2566 BE.
//

import SwiftUI

struct AddTodoView: View {
    
    @State private var task = ""
    @ObservedObject var todoList : TodoList
    @State private var showingAlert = false
    
    var body: some View {
        NavigationStack{
            VStack{
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 300, height: 50)
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    .foregroundStyle(.white)
                    .overlay {
                        TextField("What would you like to add?", text: $task)
                            .multilineTextAlignment(.center)
                        
                    }
                    .padding(.top)
                Button(action: {
                    if task == "" {
                        showingAlert = true
                    } else{
                        todoList.AddTodo(task: task)
                        todoList.showAddTodoView.toggle()
                    }
                }, label: {
                    Text("Add Todo")
                        .font(.title2)
                        .bold()
                        .frame(width: 300, height: 50)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .alert("Note can't be empty.", isPresented: $showingAlert) {
                            Button("OK") { }}
                }).padding()
                Spacer()
            }.navigationTitle("Add a note 📝")
                .padding(.top, 35)
        }
    }
}

#Preview {
    AddTodoView(todoList: TodoList())
}
