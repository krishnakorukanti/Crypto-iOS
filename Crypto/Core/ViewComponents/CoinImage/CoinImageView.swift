//
//  CoinImageView.swift
//  Crypto
//
//  Created by sai krishna korukanti on 31/03/22.
//

import SwiftUI


struct CoinImageView: View {
    @StateObject var imageVm : CoinImageViewModel
    init(coin : Coin){
        _imageVm = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }
    var body: some View {
        ZStack{
            if let image = imageVm.image{
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }else if imageVm.isLoading{
                ProgressView()
            } else{
                Image(systemName: "questionmark")
                    .foregroundColor(Color.cryptoTheme.secondaryText)
            }
        }
    }
}

struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoinImageView(coin: dev.coin)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
