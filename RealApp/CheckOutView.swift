//
//  CheckOutView.swift
//  RealApp
//
//  Created by eimonkyaw on 7/22/20.
//  Copyright © 2020 eimonkyaw. All rights reserved.
//

import SwiftUI

struct CheckOutView: View {
    @EnvironmentObject var order : Order
    static let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    static let tipAmounts = [10, 15, 20, 25, 0]
    @State private var tipAmount = 1
    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var showingPaymentAlert = false
    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(0 ..< CheckOutView.self.paymentTypes.count) {
                        Text(CheckOutView.self.paymentTypes[$0])
                    }
                }
                
                Toggle(isOn: $addLoyaltyDetails.animation()) {
                    Text("Add Loyalty card")
                }
                if addLoyaltyDetails {
                    TextField("Enter Loyalty ID", text : $loyaltyNumber)
                }
                
            }
            
            Section(header: Text("Add a tip ?")) {
                Picker("Percentage: ", selection: $tipAmount) {
                    ForEach(0 ..< CheckOutView.self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Total :$\(totalPrice, specifier: "%.2f")")
                .font(.largeTitle)) {
                Button("Confirm Order") {
                    self.showingPaymentAlert.toggle()
                }
            }
        }
        .navigationBarTitle(Text("Payment"),displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert) {
            // more to come
            Alert(title: Text("Order confirmed"), message: Text("Your total was $\(totalPrice, specifier: "%.2f") – thank you!"), dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static var order = Order()
    static var previews: some View {
        CheckOutView().environmentObject(order)
    }
}
