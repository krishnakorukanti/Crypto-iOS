//
//  HomeView.swift
//  Crypto
//
//  Created by sai krishna korukanti on 30/03/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm : HomeViewModel
    @State private var showPortfolio : Bool = false
    var body: some View {
        ZStack{
            //MARK: - BackGround Layers
            Color.cryptoTheme.background.ignoresSafeArea()
            
            //MARK: - Content Layer
            VStack{
            homeHeader
                columnTitleView
                if !showPortfolio{
                    allCoinsList
                        .transition(.move(edge: .leading))
                }
                else{
                    portfolioCoinsList
                        .transition(.move(edge: .trailing))
                }
               
               
                Spacer(minLength: 0)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        HomeView()
                .navigationBarHidden(true)
        }.environmentObject(dev.homeVM)
    }
}

extension HomeView{
    private var homeHeader : some View{
        HStack{
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none)
                .background(
                CircleButtonAnimationView(animate: $showPortfolio))
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.cryptoTheme.accent)
                .animation(.none)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()){
                        showPortfolio.toggle()
                    }
                }
        }.padding(.horizontal)
    }
    
    private var allCoinsList : some View{
        List{
            ForEach(vm.allCoins){ coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                
            }
        }.listStyle(PlainListStyle())
    }
    private var portfolioCoinsList: some View{
        List{
            ForEach(vm.portfolioCoins){ coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                
            }
        }.listStyle(PlainListStyle())
    }
    
    private var columnTitleView: some View{
        HStack{
            Text("Coin")
            Spacer()
            if showPortfolio{
                Text("Holdings")
            }
            Text("Price")
                .frame(width : UIScreen.main.bounds.width/3.5,alignment: .trailing)
                
        }.font(.caption)
            .foregroundColor(Color.cryptoTheme.secondaryText)
            .padding(.horizontal)
    }
}
