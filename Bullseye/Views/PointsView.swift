//
//  PointsView.swift
//  Bullseye
//
//  Created by rajivmanivannan on 21/02/22.
//

import SwiftUI

struct PointsView: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        VStack (spacing:10){
            InstructionText(text: "The Slider value is")
            BigNumberText(text: String(roundedValue))
            BodyText(text: "You Scored \(points) points")
            Button(action:{
                game.startNewRound(points: points)
                withAnimation{
                alertIsVisible = false
                }
            }) {
                ButtonText(text:"Start New Round" )
            }
        }
        .padding()
        .frame(maxWidth:300)
        .background(Color("BackgroundColor"))
        .cornerRadius(Constants.General.roundRectCornerRadius)
        .shadow(radius: 10, x: 5, y: 5)
    }
}

struct PointsView_Previews: PreviewProvider {
    static private var alertIsVisible = Binding.constant(true)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())
    
    
    static var previews: some View {
        PointsView(alertIsVisible:alertIsVisible, sliderValue: sliderValue, game: game)
    }
}
