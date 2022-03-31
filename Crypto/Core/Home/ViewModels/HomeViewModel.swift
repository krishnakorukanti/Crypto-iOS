//
//  HomeViewModel.swift
//  Crypto
//
//  Created by sai krishna korukanti on 31/03/22.
//

import Foundation
import Combine
class HomeViewModel : ObservableObject{
    
    @Published var allCoins : [Coin] = []
    @Published var portfolioCoins : [Coin] = []
    
    private let coinDataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        addSubscribers()
    }
    func addSubscribers(){
        coinDataService.$allCoins
            .sink { [weak self](fetchedCoins) in
                self?.allCoins = fetchedCoins
            }
            .store(in: &cancellables)
    }
}
