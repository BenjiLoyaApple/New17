//
//  View+Extensions.swift
//
//  Created by Benji Loya on 14/12/2022.
//

import SwiftUI

///   MARK: View Extension For UI Building
extension View {
    
    //   MARK: - Closing all Active Keyboards
    func closeKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    //     MARK: - Disabling with Opacity
    func disableWithOpacity(_ condition: Bool)->some View{
        self
            .disabled(condition)
            .opacity(condition ? 0.5 : 1)
    }
    
    func hAlign(_ aligment: Alignment)->some View {
        self
            .frame(maxWidth: .infinity, alignment: aligment)
    }
    
    func vAlign(_ aligment: Alignment)->some View {
        self
            .frame(maxHeight: .infinity, alignment: aligment)
    }
    
    //    MARK: - Custom Border View With Padding
    func border(_ width: CGFloat,_ color: Color)->some View {
        self
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            .background {
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .stroke(color, lineWidth: width)
            }
    }
    
    //    MARK: - Custom Fill View With Padding
    func fillView(_ color: Color)->some View {
        self
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            .background {
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .fill(color)
            }
    }
    
    //    MARK: - Custom onAppear View Animation
    func animate(flag: Binding<Bool>, yOffset: CGFloat, xOffset: CGFloat = 0, duration: Double = 0.7, delay: Double = 0.0, opac: Double = 1.0) -> some View {
        self.opacity(flag.wrappedValue ? 1 : 0)
            .offset(y: flag.wrappedValue ? 0 : yOffset)
            .offset(x: flag.wrappedValue ? 0 : xOffset)
            .opacity(flag.wrappedValue ? 1 : opac)
            .animation(.easeInOut(duration: duration), value: flag.wrappedValue)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    flag.wrappedValue = true
                }
            }
        /*
         // in View's
         @State private var showAnimation = false
         
        .animate(flag: $showAnimation, yOffset: 600, delay: 0.5, opac: 0.5)
        */
    }
    
    //    MARK: - Time Out
//    func timeoutControls(withAnimationFlag animationFlag: Binding<Bool>) {
//        var timeOutTask: DispatchWorkItem?
//        if let timeOutTask {
//            timeOutTask.cancel()
//        }
//        timeOutTask = DispatchWorkItem {
//            withAnimation {
//                animationFlag.wrappedValue = false
//            }
//        }
//        if let timeOutTask {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: timeOutTask)
//        }
//    }
    
}
