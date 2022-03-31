//
//  CoinDataService.swift
//  Crypto
//
//  Created by sai krishna korukanti on 31/03/22.
//

import Foundation
import Combine
class CoinDataService{
    
    // url - https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h
    @Published var allCoins : [Coin] = []
 
    var coinSubscription : AnyCancellable?
    init(){
        getCoins()
    }
    private func getCoins(){
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h")
        else {return}
        
        coinSubscription =  NetworkingManager.download(url: url)
            .decode(type: [Coin].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (fetchedCoins) in
                self?.allCoins = fetchedCoins
                self?.coinSubscription?.cancel()
            })
            
          

        
        
    }
}
