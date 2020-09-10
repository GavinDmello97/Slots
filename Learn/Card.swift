//
//  Card.swift
//  Learn
//
//  Created by Zaya Developer on 10/09/20.
//  Copyright © 2020 Zaya Developer. All rights reserved.
//

import SwiftUI

struct Card: View {
    @Binding var symbol: String
    @Binding var backgroundColor: Color

    

    var body: some View {
        Image(self.symbol).resizable().aspectRatio(1, contentMode: .fit)
            .padding(.all, 20).background(self.backgroundColor.opacity(0.5)).cornerRadius(20)    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(symbol: Binding.constant("apple"), backgroundColor: Binding.constant(Color(.white)))
    }
}
