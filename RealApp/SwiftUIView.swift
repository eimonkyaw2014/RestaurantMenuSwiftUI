//
//  SwiftUIView.swift
//  RealApp
//
//  Created by eimonkyaw on 7/22/20.
//  Copyright © 2020 eimonkyaw. All rights reserved.
//

import SwiftUI

struct SwiftUIView: View {
    var me = Bundle.main.decode([MenuSection].self, from: "menu.json")
    var body: some View {
        NavigationView {
            List {
                ForEach(me) { section in
                    Section(header: Text(section.name)) {
                        ForEach(section.items) {
                            item in
                           ItemRow(item: item)
                        }
                    }
                }
            }.navigationBarTitle("Menu")
            .listStyle(GroupedListStyle())
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
