//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Martyn Palmer on 16/04/2020.
//  Copyright © 2020 Martyn Palmer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // Teneray VAR used for operator
    @State private var useRedText = false
    
    // Views as Properties
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")
    
    // Computered properties
    var motto3: some View {Text("Draco dormiens AND nunquam titillandus")}
    
    var body: some View {
        VStack {
            
            // Modifiers
            Text("Hello World")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.red)
            .edgesIgnoringSafeArea(.all)
            
            // Ordering Modifiers
            Button("Hello World") {
                print(type(of: self.body))
            }
            .frame(width: 200, height: 200)
            .background(Color.red)
            
            // Teneray Operator
            Button("Hello World") {
                // flip the Boolean between true and false
                self.useRedText.toggle()
            }
            .foregroundColor(useRedText ? .red : .blue)
            
            motto1
                .foregroundColor(.blue)
            motto2
                .foregroundColor(.yellow)
            motto3
                .foregroundColor(.purple)
            
            
                          
                      
            
            // Environment Modifier
            Text("Gryffindor")
                .font(.largeTitle)
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }.font(.title) // Environment Modifier
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
