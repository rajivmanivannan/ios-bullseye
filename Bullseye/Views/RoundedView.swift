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
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay(
                Circle().strokeBorder(Color("ButtonStrokeColor"),
                                      lineWidth: Constants.General.roundRectCornerRadius)
            )
    }
}

struct RoundedImageViewFiled: View {
    var systemName:String
    var body: some View {
        Image(systemName:systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .background(Circle().fill(Color("ButtonFilledBackgroundColor")))
    }
}

struct RoundedRectangleTextView: View {
    var text:String
    var body: some View {
        Text(text)
            .kerning(-0.2)
            .font(.title3)
            .frame(width: Constants.General.roundViewRectWidth, height: Constants.General.roundViewRectHeight)
            .foregroundColor(Color("TextColor"))
            .overlay(
                RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                    .stroke(lineWidth:Constants.General.roundRectCornerRadius)
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
