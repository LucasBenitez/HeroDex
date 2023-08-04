//
//  SpeechIndicatorComponent.swift
//  HeroDex
//
//  Created by Lucas Emiliano Benitez Joncic on 03/08/2023.
//

import SwiftUI
struct CircleGradient: View {
    var colors: [Color]
    var body: some View {
        Circle()
            .fill(RadialGradient(gradient: .init(colors: colors),
                                 center: .topLeading,
                                 startRadius: 5,
                                 endRadius: 50))
            .aspectRatio(contentMode: .fit)
    }
}
struct SpeechIndicatorComponent: View {
    // Indicar la velocidad de parpadeo
    var blinkSpeed: Double
    // Estado cuando no parpadea el color es mas solido
    var blinkColor1: Color
    // Estado cuando no parpadea el color mas clarito
    var blinkColor2: Color
    @State private var isBlinking = false
    @State private var isAnimating = false
    var body: some View {
        CircleGradient(colors: [Color.white, blinkColor1])
            .opacity(isBlinking ? 0 : 1)
            .frame(width: 100,height: 100)
            .onAppear() {
                withAnimation(Animation.easeOut(duration: blinkSpeed).repeatForever(autoreverses: true)) {
                                self.isBlinking.toggle()
                            }
                self.isBlinking = true
            }
        CircleGradient(colors: [Color.white, blinkColor2])
            .opacity(isBlinking ? 0 : 1)
            .frame(width: 100,height: 100)
            .onAppear() {
                withAnimation(Animation.easeOut(duration: blinkSpeed)) {
                                self.isBlinking.toggle()
                            }
                self.isBlinking = !isBlinking
            }
        Circle()
            .stroke(Color.white, lineWidth: 5)
            .shadow(color: .black.opacity(0.9),
                    radius: 5,
                    x: 0,
                    y: 5)
            .frame(width: 100, height: 100)
    }
}

struct SpeechIndicatorComponent_Previews: PreviewProvider {
    static var previews: some View {
        Color.red.ignoresSafeArea().overlay {
            SpeechIndicatorComponent(blinkSpeed: 1,
                                     blinkColor1: Color(red:0.2,
                                                        green: 0.6,
                                                        blue: 1.0),
                                     blinkColor2: Color.blue)
        }
    }
}
