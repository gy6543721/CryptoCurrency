//
//  TopCryptoView.swift
//  CryptoCurrency
//
//  Created by Macbook Air M1 on 2022/12/13.
//

import SwiftUI

struct TopCryptoView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            // Title
            Text("Top")
                .font(.title2)
                .fontWeight(.bold)
            // ItemView
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(viewModel.topCrypto) { crypto in
                        
                        NavigationLink {
                            CryptoDetailView()
                        } label: {
                            TopCryptoItemView(topCrypto: crypto)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 10)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }.padding()
    }
}

struct TopCryptoView_Previews: PreviewProvider {
    static var previews: some View {
        TopCryptoView(viewModel: HomeViewModel())
    }
}
