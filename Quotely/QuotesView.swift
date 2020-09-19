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
            .navigationBarItems(trailing: barButton(.plus) {
                self.isAddQuoteViewPresented = true
            })
            .sheet(isPresented: $isAddQuoteViewPresented) {
                AddQuoteView(isPresented: self.$isAddQuoteViewPresented, onCreate: { title, author in
                    print("title:", title)
                    print("author:", author)
                })
            }
        }
    }
}

