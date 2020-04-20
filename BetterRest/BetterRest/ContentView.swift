//
//  ContentView.swift
//  BetterRest
//
//  Created by Martyn Palmer on 20/04/2020.
//  Copyright © 2020 Martyn Palmer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // Create default var for stepper
    @State private var sleepAmount = 8.0
    
    // Asign var to Date()
    @State private var wakeUp = Date()
    @State private var wakeUp2 = Date()
    

    
    var body: some View {
       
        
        VStack {
            // Steppers can step boudary + increment
            Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                Text("\(sleepAmount, specifier: "%.2f") hours")
            }
            
            // Dates
           DatePicker("Please enter a date",
                      selection: $wakeUp, displayedComponents: .hourAndMinute)
            .labelsHidden()
           
            
            
            
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
