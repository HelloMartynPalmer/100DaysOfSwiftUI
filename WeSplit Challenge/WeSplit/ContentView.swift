//
//  ContentView.swift
//  WeSplit
//
//  Created by Martyn Palmer on 17/04/2020.
//  Copyright © 2020 Martyn Palmer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2 // Selects the value within array
    
    let tipPercentages = [10, 15, 20, 25, 0]
    // Challenge 2 - Total Bill - Double Array
    var totalPerPerson: [Double] {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        // Challenge 2 - Totals Grand + Per Person
        let totals = [grandTotal, amountPerPerson]
        
        return totals
    }
    
    var body: some View {
        NavigationView {
            Form {
                
                Section {
                    TextField("Amount", text: $checkAmount).keyboardType(.decimalPad)
                    // '$' Watches the change state - two way binding
                    
                    // Picker creates new slide
                    // Challenge 3
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                   
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    // Define picker type
                    .pickerStyle(SegmentedPickerStyle())
                }
                // Challenge 1 - Add header to third section
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson[1], specifier: "%.2f")") // Remove additional floating points by .00 - 2 digits after decimal point
                }
                // Challenge 2 - Total bill value
                Section(header: Text("Total Bill")) {
                    Text("$\(totalPerPerson[0], specifier: "%.2f")")
                }
                
            }
            // Navigation bar title to live inside Navigation View as you can have mulitple titles
            .navigationBarTitle("WeSplit")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
