//
//  ContentView.swift
//  multiplicationsGame
//
//  Created by Beto Toro on 11/07/22.
//

import SwiftUI

struct ContentView: View {
  
  @State private var multiplicationTable = Int.random(in: 1...10)
  @State private var numberOfQuestions: Int = 5
  @State private var correctAnswer: Int = 0
  @State private var startGame = false
  @State private var question = 1
  @State private var result = [Int]()
  let times = Int.random(in: 1...10)
  
  func askquestion() {
    let table = multiplicationTable + 1
    let realResult = table * times
    
    result.insert(realResult, at: 0)
    result.insert(table * Int.random(in: 1...10), at: 0)
    result.insert(table, at: 0)
    
    result = result.shuffled()
  }
  
  var body: some View {
    let table = multiplicationTable + 1
    
    NavigationView {
      List {
        Section {
          Picker("Choose the table", selection: $multiplicationTable) {
            ForEach(0..<10) {
              Text("\($0 + 1)")
            }
          }
          Picker("How many question do you want?", selection: $numberOfQuestions) {
            ForEach(0..<20) {
              Text("\($0 + 1)")
            }
          }
        }
        
        Section {
          if !startGame {
            HStack {
              Spacer()
              Button("Start") {
                startGame.toggle()
                askquestion()
              }
              Spacer()
            }
          }
          
          if !startGame {
            HStack {
              Spacer()
              VStack {
                Text("how much is \(table) times \(times)")
                ForEach(0..<3) {
                  Text("\(String(result[$0]) ?? "h")")
                }
                Button("continue") {
                  question += 1
                }
              }
              Spacer()
            }
          }
        }
      }
      .navigationTitle("How much is ?")
      
    }
    
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
