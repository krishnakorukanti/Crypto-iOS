//
//  Color.swift
//  Crypto
//
//  Created by sai krishna korukanti on 30/03/22.
//

import Foundation
import SwiftUI

extension Color{
    
    static let cryptoTheme = ColorTheme()
}

struct ColorTheme{
    
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")

    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")

}
