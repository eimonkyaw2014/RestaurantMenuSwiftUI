//
//  AppView.swift
//  RealApp
//
//  Created by eimonkyaw on 7/22/20.
//  Copyright © 2020 eimonkyaw. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            SwiftUIView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Menu")
            }
            
            OrderView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Order")
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var order = Order()
    static var previews: some View {
        AppView().environmentObject(order)
    }
}
