//
//  CoinRowView.swift
//  Crypto
//
//  Created by sai krishna korukanti on 30/03/22.
//

import SwiftUI

struct CoinRowView: View {
    let coin : Coin
    let showHoldingsColumn : Bool
    var body: some View {
        HStack( spacing: 0){
            leftColumn
            Spacer()
            if showHoldingsColumn{
                centerColumn
            }
            rightColumn
           
        }.font(.subheadline)
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: dev.coin, showHoldingsColumn: true)
            .previewLayout(.sizeThatFits)
        CoinRowView(coin: dev.coin, showHoldingsColumn: true)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}

extension CoinRowView{
    
    private var leftColumn : some View{
        HStack(spacing : 0){
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.cryptoTheme.secondaryText)
                .frame(minWidth : 30)
           CoinImageView(coin: coin)
                .frame(width: 30, height: 30, alignment: .center)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading,6)
                .foregroundColor(Color.cryptoTheme.accent)
        }
    }
    private var centerColumn : some View{
        VStack(alignment: .trailing){
            Text(coin.currentHoldingsValue.asCurrencyWith6Decimals())
                .bold()
                
            Text((coin.currentHoldings ?? 0).asNumberString())
               
        }.foregroundColor(Color.cryptoTheme.accent)
    }
    private var rightColumn : some View{
        VStack(alignment: .trailing){
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .bold()
                .foregroundColor(Color.cryptoTheme.accent)
            Text(coin.priceChangePercentage24H?.asPercentageString() ?? "")
                .foregroundColor(
                    (coin.priceChangePercentage24H ?? 0)>=0 ?
                    Color.cryptoTheme.green : Color.cryptoTheme.red
                    )
            
        }.frame(width : UIScreen.main.bounds.width/3.5,alignment: .trailing)
    }
}
