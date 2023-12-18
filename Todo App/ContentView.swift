//
//  ContentView.swift
//  Todo App
//
//  Created by Palatip Jantawong on 17/12/2566 BE.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack{
                List{
                    ForEach(0...3, id: \.self) { todo in
                        Text("hellp")
                    }
                }
            }.navigationTitle("Todo")
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            //
                        }, label: {
                            Text("Add Todo")
                        })
                    }
                }
        }
    }
}

struct Todo: Identifiable {
    var id = UUID()
    var task : String
}

#Preview {
    ContentView()
}
