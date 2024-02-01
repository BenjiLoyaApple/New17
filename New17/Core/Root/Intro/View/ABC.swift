//
//  ABC.swift
//  Acustom
//
//  Created by Benji Loya on 08.01.2024.
//

import SwiftUI

struct ABC: View {
    let text = "The Lone Star State"
    @State private var animatedText = ""

    var body: some View {
        GeometryReader { geometry in
            HStack {
                Text(animatedText)
                    .font(.system(size: 33))
                    .fontWeight(.black)
                    .onAppear {
                        animateText()
                    }
                    .frame(height: geometry.size.height / 0.55)
//                    .background(Color.red)
            }
        }
    }

    private func animateText() {
        for (index, char) in text.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.055) {
                animatedText += String(char)
            }
        }
    }
}

#Preview {
    ABC()
}
