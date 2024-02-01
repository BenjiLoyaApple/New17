//
//  Shine.swift
//  Note
//
//  Created by Benji Loya on 31.12.2023.
//

import SwiftUI

extension View {
    /// Custom View Modifier
    @ViewBuilder
    func shine(_ toggle: Bool, duration: CGFloat = 0.5, clipShape: some Shape = .rect, rightToLeft: Bool = false) -> some View {
        self
            .overlay {
                GeometryReader {
                    let size = $0.size
                    /// Negative Dutation
                    let moddedDuration = max(0.3, duration)
                    
                    Rectangle()
                        .fill(.linearGradient(
                            colors: [
                                .clear,
                                .clear,
                                .white.opacity(0.1),
                                .white.opacity(0.5),
                                .white.opacity(1),
                                .white.opacity(0.5),
                                .white.opacity(0.1),
                                .clear,
                                .clear
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        ))
                        .scaleEffect(y: 8)
                        .keyframeAnimator(initialValue: 0.0, trigger: toggle, content: {
                            content, progress in
                            content
                                .offset(x: -size.width + (progress * (size.width * 2)))
                        }, keyframes: { _ in
                            CubicKeyframe(.zero, duration: 0.1)
                            CubicKeyframe(1, duration: moddedDuration)
                        })
                        .rotationEffect(.init(degrees: 45))
                        .scaleEffect(x: rightToLeft ? -1 : 1)
                    
                }
            }
            .clipShape(clipShape)
    }
}


/*
 //MARK: View
 
 @State private var shine: Bool = false
 
 VStack {
     
     Button("Share Post", systemImage: "star") {
         
     }
     .buttonStyle(.borderedProminent)
     .buttonBorderShape(.capsule)
     .shine(shine, duration: 0.8, clipShape: .capsule)
     
     
     Image(.img5)
         .resizable()
         .aspectRatio(contentMode: .fill)
         .frame(width: 200, height: 200)
         .shine(shine, duration: 0.8, clipShape: .rect(cornerRadius: 20), rightToLeft: true)
         .onTapGesture {
             shine.toggle()
         }
 }
 */
