//
//  ContentView.swift
//  Bullseye
//
//  Created by rajivmanivannan on 16/02/22.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var alertIsVisible = false
    @State private var sliderValue = 1.0
    @State private var game = Game()
    
    
    
    var body: some View {
        VStack {
            Text("🎯 \n Put the Bullseye as close as you can to").bold()
                .kerning(2.0)
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
            Text("\(game.target)")
                .kerning(-1.0)
                .bold()
                .font(.largeTitle)
            HStack{
                Text("1").bold()
                Slider(value: $sliderValue, in:1.0...100.0)
                Text("100").bold()
            }
            Button(action: {
                alertIsVisible = true
            }){
                Text("Hit me").padding()
            }
            .alert(isPresented: $alertIsVisible, content: {
                return Alert(title: Text("Hello"), message: Text("The slider value is\(game.points(sliderValue: Int(sliderValue)))"), dismissButton: .default(Text("awesome")))
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
