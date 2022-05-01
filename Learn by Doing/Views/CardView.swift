//
//  CardView.swift
//  Learn by Doing
//
//  Created by Laura Johnson on 4/30/22.
//

import SwiftUI

struct CardView: View {
    var card: Card
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    @State private var fadeIn: Bool = false
    @State private var moveDownward: Bool = false
    @State private var moveUpward: Bool = false
    @State private var showAlert: Bool = false
    
    var body: some View {
        ZStack {
            Image(card.imageName)
                .opacity(fadeIn ? 1.0 : 0.0)
            
            VStack {
                Text(card.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                Text(card.headline)
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .italic()
            }
            .offset(y: moveDownward ? -218 : -300)
            
            Button(action: {
                playSound(sound: "sound-chime", type: "mp3")
                self.hapticImpact.impactOccurred()
                self.showAlert.toggle()
            }, label: {
                HStack {
                    Text(card.callToAction)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                    Image(systemName: "arrow.right.circle")
                        .font(Font.title.weight(.medium))
                        .foregroundColor(Color.white)
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 20)
                .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .leading, endPoint: .trailing))
                .clipShape(Capsule())
                .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
            })
            .offset(y: moveUpward ? 210 : 300)
        }
        .frame(width: 335, height: 545)
        .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom))
        .cornerRadius(16)
        .shadow(radius: 8)
        .onAppear() {
            withAnimation(.linear(duration: 1.2)) {
                self.fadeIn.toggle()
            }
            withAnimation(.linear(duration: 0.8)) {
                self.moveDownward.toggle()
                self.moveUpward.toggle()
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(card.title),
                message: Text(card.message),
                dismissButton: .default(Text("Ok"))
            )
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: cardData[01])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
