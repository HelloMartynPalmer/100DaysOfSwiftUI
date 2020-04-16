//
//  ContentView.swift
//  ViewsAndModifiersPart2
//
//  Created by Martyn Palmer on 16/04/2020.
//  Copyright © 2020 Martyn Palmer. All rights reserved.
//

import SwiftUI

// View Composition
struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
    }
}

// Custom Modifiers
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

// Creating new view structures
struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}

// Custom Containers

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content

    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<self.columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
}


struct ContentView: View {
    var body: some View {
       
            VStack(spacing: 10) {
                CapsuleText(text: "First")
                    .foregroundColor(.white)
                CapsuleText(text: "Second")
                    .foregroundColor(.yellow)
               
                // Custom Modifiers
                Text("Hello World")
                .titleStyle()
                
                // View structures
                Color.blue
                .frame(width: 300, height: 200)
                .watermarked(with: "Hacking with Swift")
                
                
                GridStack(rows: 4, columns: 4) { row, col in
                   Text("R\(row) C\(col)")
               }
            }
           
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
