//
//  RoundedImageViewStorked.swift
//  Bullseye
//
//  Created by rajivmanivannan on 19/02/22.
//

import SwiftUI

struct RoundedImageViewStorked: View {
    var systemName:String
    var body: some View {
        Image(systemName:systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: 56.0, height: 56.0)
            .overlay(
                Circle().strokeBorder(Color("ButtonStrokeColor"),
                lineWidth: 2.0)
            )
    }
}

struct RoundedImageViewFiled: View {
    var systemName:String
    var body: some View {
        Image(systemName:systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: 56.0, height: 56.0)
            .background(Circle().fill(Color("ButtonFilledBackgroundColor")))
    }
}

struct RoundedRectangleTextView: View {
    var text:String
    var body: some View {
        Text(text)
            .kerning(-0.2)
            .font(.title3)
            .frame(width: 68.0, height: 56.0)
            .foregroundColor(Color("TextColor"))
            .overlay(
                RoundedRectangle(cornerRadius: 20.0)
                    .stroke(lineWidth:2.0)
            )
            .foregroundColor(Color("ButtonStrokeColor"))
            
    }
}


struct RoundedImageViewStorked_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing:10){
        RoundedImageViewStorked(systemName: "arrow.counterclockwise")
        RoundedImageViewFiled(systemName: "list.dash")
        RoundedRectangleTextView(text: "100")
        }
    }
}
