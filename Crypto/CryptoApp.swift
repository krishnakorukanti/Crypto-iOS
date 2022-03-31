//
//  CryptoApp.swift
//  Crypto
//
//  Created by sai krishna korukanti on 30/03/22.
//

import SwiftUI

@main
struct CryptoApp: App {
    @StateObject var vm = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView()
                    .navigationBarHidden(true)
            }.environmentObject(vm)
        }
    }
}
