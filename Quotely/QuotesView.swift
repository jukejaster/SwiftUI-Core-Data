//
//  QuotesView.swift
//  Quotely
//
//  Created by Juke Jaster on 9/17/20.
//  Copyright © 2020 Juke Jaster. All rights reserved.
//

import SwiftUI

struct QuotesView: View {
    @State private var isAddQuoteViewPresented = false
    
    var body: some View {
        NavigationView {
            List {
                Text("Quote")
            }
            .navigationBarTitle("Quotely")
            .navigationBarItems(trailing: trailingBarButtonItem)
            .sheet(isPresented: $isAddQuoteViewPresented) {
                AddQuoteView(isPresented: self.$isAddQuoteViewPresented, onCreate: { title, author in
                    print("title:", title)
                    print("author:", author)
                })
            }
        }
    }
    
    private var trailingBarButtonItem: some View {
        Button(action: {
            self.isAddQuoteViewPresented = true
        }) {
            Image(systemName: "plus")
        }
    }
}

struct AddQuoteView: View {
    typealias CreateCompletion = (_ title: String, _ author: String) -> Void
    
    @State private var title = ""
    @State private var author = ""
    @Binding var isPresented: Bool
    let onCreate: CreateCompletion
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Title...", text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Author...", text: $author)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Spacer()
            }
            .padding()
            .navigationBarTitle("Add Quote")
            .navigationBarItems(trailing: trailingBarButtonItem)
        }
    }
    
    private var trailingBarButtonItem: some View {
        Button(action: {
            self.isPresented = false
            self.onCreate(self.title, self.author)
        }) {
            Text("Done")
                .fontWeight(.medium)
                .foregroundColor(.blue)
        }
    }
}
