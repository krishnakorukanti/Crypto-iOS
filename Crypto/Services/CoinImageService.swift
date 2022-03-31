//
//  CoinImageService.swift
//  Crypto
//
//  Created by sai krishna korukanti on 31/03/22.
//

import Foundation
import SwiftUI
import Combine
class CoinImageService{
    
    
    @Published var coinImage : UIImage? = nil
   private var imageSusbscription : AnyCancellable?
    
    private let coin : Coin
    
    init(coin : Coin){
        self.coin = coin
      getCoinImage()
    }
    
    private func getCoinImage(){
        
        guard let url = URL(string: coin.image)
        else {return}
        
        imageSusbscription =  NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (fetchedImage) in
                self?.coinImage = fetchedImage
                self?.imageSusbscription?.cancel()
            })
            
    }
}
