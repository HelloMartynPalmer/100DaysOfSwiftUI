//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Martyn Palmer on 18/04/2020.
//  Copyright © 2020 Martyn Palmer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var threeTwoOne = ["Rock", "Paper", "Scissors"]
    @State private var go = Int.random(in: 0...2)
    @State private var showingScore = false

    
    @State private var scoreTitle = ""

   @State private var currentScore = 0
    
   // Challenge 3 - Custom message based on true or false
   @State private var scoreMessage = ""
    
    
    @State private var currentChoice = ""
    @State private var playerWin = false
    
    
    // Score
    @State private var playerScore = ""
    @State private var iPhoneScore = ""
    
    // Colour yellow
    static let gradientStart = Color(red: 255.0 / 255, green: 204.0 / 255, blue: 51.0 / 255)
    static let gradientEnd = Color(red: 229.0 / 255, green: 183.0 / 255, blue: 45.0 / 255)
    

    var body: some View {
        ZStack {
        RadialGradient(gradient: Gradient(colors: [Self.gradientStart, Self.gradientEnd]), center: .center, startRadius: 2, endRadius: 650).edgesIgnoringSafeArea(.all)
            
            VStack {
             
                
                VStack {
                    
                    HStack {
                        Text("Rock. 👊")
                            .fontWeight(.black)
                        Text("Paper. ✋")
                            .fontWeight(.bold)
                    }.font(.system(size: 40)).padding(.top, 40)
                
                    HStack {
                        Text("Scissors! ✌️")
                            .italic()
                            .font(.system(size: 40))
                            .fontWeight(.medium)
                    }
                }
               
                
                VStack {
                    
                    
                    // Create countdown and reveal on Selection x 10 (Show winner!)
                    // Update Round no.
                    Text("Round X - 3, 2, 1... Go!")
                        .font(.system(size: 20))
                    
                    Spacer()
                    
                    Text(threeTwoOne[go]).font(.largeTitle)
                    
                    
                    Spacer()
                    /*
                        Create section: Select - Rock, Paper or Scissors
                    */
                    Text("Make your selection")
                    
                    HStack {
                        ForEach(0 ..< threeTwoOne.count) { choice in
                            Button(action: {
                                self.optionSelected(choice)
                            }) {
                                Text(self.threeTwoOne[choice])
                            }
                        }
                    }
                    
                  
                    
                    // Update Score based on winner.
                    Text("Best of 10")
                        .fontWeight(.bold)
                        .font(.system(size: 15))
                    
                    Text("Player X - X iPhone")
                        .font(.system(size: 20))
                    
                   
                }
                
               
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("\(scoreMessage)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
        })
        }
    }
    
    
    
    func optionSelected(_ choice: Int) {
        if choice == go {
            scoreTitle = "Correct"
            currentScore += 1
            scoreMessage = "Well done, you paid attention in geography!"
        } else {
            scoreTitle = "Wrong"
            currentScore += -1
            // Challenge 3 - Add custom incorrect message
            scoreMessage = "Uh ohhh, you need to learn your flags"
        }

        showingScore = true
    }
    func askQuestion() {
        threeTwoOne.shuffle()
        go = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
