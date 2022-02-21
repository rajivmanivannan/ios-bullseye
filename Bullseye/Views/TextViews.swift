//
//  Textviews.swift
//  Bullseye
//
//  Created by rajivmanivannan on 19/02/22.
//

import SwiftUI

struct InstructionText: View {
    var text:String
    var body: some View {
        Text(text).bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
}


struct BigNumberText: View {
    var text:String
    var body: some View {
        Text(text)
            .kerning(-1.0)
            .bold()
            .font(.largeTitle)
            .foregroundColor(Color("TextColor"))
    }
}

struct SliderLabelText: View {
    var text:String
    var body: some View {
        Text(text)
            .bold()
            .frame(width: 35.0)
            .foregroundColor(Color("TextColor"))
    }
}

struct LabelText: View {
    var text:String
    var body: some View {
        Text(text)
            .kerning(-1.0)
            .foregroundColor(Color("TextColor"))
            .font(.caption)
    }
}

struct BodyText: View {
    var text:String
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12.0)
    }
}

struct ButtonText: View {
    var text:String
    var body: some View {
        Text(text)
            .bold()
            .padding()
            .frame(maxWidth:.infinity)
            .background(Color.accentColor)
            .foregroundColor(.white)
            .cornerRadius(12.0)
    }
}




struct Textviews_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            InstructionText(text:"InstructionText")
            BigNumberText(text: "82")
            SliderLabelText(text: "100")
            LabelText(text: "SCORE")
            BodyText(text: "You scored 95 points\n 🎉🎉🎉")
            ButtonText(text: "Start New Round")
        }.padding()
    }
}
