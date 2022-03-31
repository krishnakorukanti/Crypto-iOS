//
//  CoinImageViewModel.swift
//  Crypto
//
//  Created by sai krishna korukanti on 31/03/22.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel : ObservableObject{
    @Published var image : UIImage? = nil
    @Published var isLoading :Bool = true

    private let coin : Coin
    private let dataService : CoinImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin : Coin){
        self.coin = coin
        dataService = CoinImageService(coin: coin)
        self.addImageSubscribers()
        self.isLoading = true
    }
    
    private func addImageSubscribers(){
        
        dataService.$coinImage
            .sink { [weak self](_) in
                self?.isLoading = false
            } receiveValue: { [weak self](fetchedImage) in
                self?.image = fetchedImage
            }.store(in: &cancellables )

    }
}
