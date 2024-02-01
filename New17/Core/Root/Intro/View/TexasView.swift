//
//  ContentView.swift
//  Acustom
//
//  Created by Benji Loya on 07.01.2024.
//

import SwiftUI

struct TexasView: View {
    @State private var blueColor: Color = .clear
    @State private var redColor: Color = .clear
    @State private var rectangleScale: CGFloat = 1.0
    @State private var rectangleScale2: CGFloat = 1.0
    @State private var showABC: Bool = false
    
    @State private var showMainView = false
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                Rectangle()
                    .fill(.gray.opacity(0.4))
                    .fill(blueColor)
                    .frame(width: geometry.size.width * rectangleScale2)
                    .onAppear {
                        withAnimation(.bouncy(duration: 2.0)) {
                            blueColor = Color(red: 0.192, green: 0.298, blue: 0.478)
                            rectangleScale2 = 0.45
                        }
                    }
                
                VStack(spacing: 0) {
                    Rectangle()
                        .fill(Color.white)
                        .frame(height: geometry.size.height * rectangleScale)
                        .onAppear {
                                withAnimation(.bouncy(duration: 2.0).delay(0.5)) {
                                    redColor = Color(red: 0.698, green: 0.132, blue: 0.203)
                                    rectangleScale = 0.55
                                }
                            }
                        
                    Rectangle()
                        .fill(.gray.opacity(0.2))
                        .fill(redColor)
                }
            }
            .overlay(alignment: .leading) {
                Star()
                    .frame(width: 130, height: 130)
                    .overlay(overlayView.mask(starsView))
                    .padding(.leading, 25)
            }
            .ignoresSafeArea()
        }
        .overlay {
            if showABC {
                ABC()
                    .foregroundColor(.white)
                    .padding(.horizontal, 33)
                    .transition(.opacity)
                    .shadow(color: .black, radius: 1)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    showABC = true
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
                showMainView = true
            }
        }
        .fullScreenCover(isPresented: $showMainView, content: {
            AnimationTabBar()
        })
    }

    private var overlayView: some View {
        GeometryReader { geometry in
            Image("cali")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
        }
        .allowsHitTesting(false)
    }

    private var starsView: some View {
        Star()
    }
}



#Preview {
    TexasView()
}

struct Star: Shape {
    var rotationAngle: Angle

    init(rotationAngle: Angle = .degrees(-18)) {
        self.rotationAngle = rotationAngle
    }

    func path(in rect: CGRect) -> Path {
        let numberOfPoints = 5
        let starExtrusion: CGFloat = 0.4
        let center = CGPoint(x: rect.midX, y: rect.midY)
        var path = Path()

        for i in 0..<numberOfPoints * 2 {
            let angle = .pi * CGFloat(i) / CGFloat(numberOfPoints) + CGFloat(rotationAngle.radians)
            let radius = i.isMultiple(of: 2) ? rect.width / 2 : rect.width * starExtrusion / 2
            let x = center.x + cos(angle) * radius
            let y = center.y + sin(angle) * radius

            let point = CGPoint(x: x, y: y)

            if i == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }

        path.closeSubpath()

        return path
    }
}

