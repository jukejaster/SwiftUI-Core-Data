//
//  AddQuoteView.swift
//  Quotely
//
//  Created by Juke Jaster on 9/19/20.
//  Copyright © 2020 Juke Jaster. All rights reserved.
//

import SwiftUI

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
            .navigationBarItems(trailing: barButton(.done) {
                self.isPresented = false
                self.onCreate(self.title, self.author)
            })
        }
    }
}

