//
//  AddTodoView.swift
//  Todo App
//
//  Created by Palatip Jantawong on 18/12/2566 BE.
//

import SwiftUI

struct AddTodoView: View {
    
    @State private var task = ""
    
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
                    //
                }, label: {
                    Text("Add Todo")
                        .font(.title2)
                        .bold()
                        .frame(width: 300, height: 50)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        
                }).padding()
                Spacer()
            }.navigationTitle("Add a note 📝")
                .padding(.top, 35)
        }
    }
}

#Preview {
    AddTodoView()
}
