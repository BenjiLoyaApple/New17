//
//  FlightView.swift
//  New17
//
//  Created by Benji Loya on 01.02.2024.
//

import SwiftUI

struct FlightView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "airplane")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .foregroundStyle(.blue.opacity(0.4))
            
            Text("New York - Dubai")
                .font(.title2.bold())
            
            Text("21:05- 04.45")
                .bold()
                .foregroundStyle(.secondary)
            
            Divider()
        }
    }
}

#Preview {
    FlightView()
}
