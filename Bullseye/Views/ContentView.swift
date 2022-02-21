//
//  ContentView.swift
//  Bullseye
//
//  Created by rajivmanivannan on 16/02/22.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionView (game: $game).padding(.bottom, alertIsVisible ? 0 : 100)
                if alertIsVisible{
                    PointsView(alertIsVisible:$alertIsVisible,sliderValue: $sliderValue, game: $game).transition(.scale)
                }else {
                    HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game).transition(.scale)
                }
            }
            if !alertIsVisible{
                SliderView(sliderValue: $sliderValue).transition(.scale)
            }
        }
    }
}


struct InstructionView: View {
    @Binding var game: Game
    var body: some View {
        VStack{
            InstructionText(text: "🎯 \n Put the Bullseye as close as you can to")
                .padding(.leading,30.0)
                .padding(.trailing,30.0)
            BigNumberText(text: String(game.target))
        }
    }
}


struct SliderView: View {
    @Binding var sliderValue: Double
    var body: some View {
        HStack{
            SliderLabelText(text: "1")
            Slider(value: $sliderValue, in:1.0...100.0)
            SliderLabelText(text: "100")
        }.padding()
    }
}

struct HitMeButton: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        Button(action: {
            withAnimation {
            alertIsVisible = true
            }
        }){
            Text("Hit me").bold().font(.title3)
        }.padding(10.0)
            .foregroundColor(Color.white)
            .background(ZStack {
                Color("ButtonColor")
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
            })
            .cornerRadius(10.0)
            .overlay(RoundedRectangle(cornerRadius: 10.0)
                        .strokeBorder(Color.white,lineWidth: Constants.General.roundRectCornerRadius))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
        ContentView().preferredColorScheme(.dark)
        ContentView().previewLayout(.fixed(width: 568, height: 320))
    }
}


