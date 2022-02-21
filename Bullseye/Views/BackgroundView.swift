//
//  BackgroundView.swift
//  Bullseye
//
//  Created by rajivmanivannan on 20/02/22.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game:Game
    
    var body: some View {
        VStack {
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }.padding()
            .background(RingView())
        
    }
}


struct TopView: View {
    @Binding var game:Game
    
    var body: some View {
        HStack{
            Button(action:{
                game.restart()
            }){
                RoundedImageViewStorked(systemName: "arrow.counterclockwise")
            }
            Spacer()
            Button( action: {
                
            }){
                RoundedImageViewFiled(systemName: "list.dash")
            }
        }
    }
}

struct NumberView: View {
    var title:String
    var text:String
    var body: some View {
        
        VStack{
            LabelText(text:title)
            RoundedRectangleTextView(text:text)
        }
    }
}

struct BottomView: View {
    @Binding var game:Game
    
    var body: some View {
        HStack{
            NumberView(title: "SCORE", text:String(game.score))
            Spacer()
            NumberView(title: "ROUND", text: String(game.round))
        }
    }
}

struct RingView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea(.all)
            ForEach (1..<6){ ring in
                let size = CGFloat(ring * 100)
                let opacity = colorScheme == .dark ? 0.1 : 0.3
            Circle()
                .stroke(lineWidth: 20.0)
                .fill(RadialGradient(gradient: Gradient(colors: [Color("RingsColor").opacity(opacity), Color("RingsColor").opacity(0)]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: 100, endRadius: 3))
                .frame(width: size, height: size)
            }
        }
    }
    
}
struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
