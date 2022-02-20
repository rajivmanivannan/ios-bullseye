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
        .background(Color("BackgroundColor"))
        .ignoresSafeArea(.all)
            
    }
}


struct TopView: View {
    @Binding var game:Game
    
    var body: some View {
        HStack{
            RoundedImageViewStorked(systemName: "arrow.counterclockwise")
            Spacer()
            RoundedImageViewFiled(systemName: "list.dash")
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


struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
