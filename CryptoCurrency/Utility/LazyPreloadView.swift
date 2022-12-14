//
//  LazyPreload.swift
//  CryptoCurrency
//
//  Created by Macbook Air M1 on 2022/12/14.
//

import Foundation
import SwiftUI

struct LazyPreloadView<Content: View>: View {
    let build:() -> Content
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}
