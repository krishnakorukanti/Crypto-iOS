//
//  CircleButtonView.swift
//  Crypto
//
//  Created by sai krishna korukanti on 30/03/22.
//

import SwiftUI

struct CircleButtonView: View {
    let iconName : String
    var body: some View {
       Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.cryptoTheme.accent)
            .frame(width: 50, height: 50)
            .background(
            Circle()
                .foregroundColor(Color.cryptoTheme.background)
            )
            .shadow(color: Color.cryptoTheme.accent.opacity(0.25), radius: 10, x: 0.0, y: 0.0)
            .padding()
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            CircleButtonView(iconName: "info")
                .previewLayout(.sizeThatFits)
            CircleButtonView(iconName: "plus")
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
      
    }
}
