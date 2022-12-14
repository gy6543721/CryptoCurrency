//
//  SwiftUIView.swift
//  CryptoCurrency
//
//  Created by Macbook Air M1 on 2022/12/14.
//

import SwiftUI

struct CryptoSectionView: View {
    let model: CryptoSectionModel
    
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            Text(model.title)
                .font(.title)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            LazyVGrid(columns: columns, alignment: .leading, spacing: 20) {
                ForEach(model.status) { status in
                    CryptoItemView(model: status)
                }
            }
        }.padding(20)
    }
}

struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoSectionView(model: dev.sessionModel)
    }
}
