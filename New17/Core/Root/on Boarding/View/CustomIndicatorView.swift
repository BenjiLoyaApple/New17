//
//  CustomIndicatorView.swift
//  NewForSwiftUI
//
//  Created by Benji Loya on 03/04/2023.
//

import SwiftUI

struct CustomIndicatorView: View {
    /// view Properties
    var totalPages: Int
    var currentPage: Int
    var activeTint: Color = .black
    var inActiveTint: Color = .gray.opacity(0.5)
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<totalPages, id: \.self) {
                Circle()
                    .fill(currentPage == $0 ? activeTint : inActiveTint)
                    .frame(width: 4, height: 4)
            }
        }
    }
}

struct CustomIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        HomeOnBoard()
    }
}
