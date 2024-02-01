//
//  OffsetKey.swift
//  ios17
//
//  Created by Benji Loya on 14.12.2023.
//

import SwiftUI

struct OffsetKey: PreferenceKey {
    static var defaultValue: [String: Anchor<CGRect>] = [:]
    static func reduce(value: inout [String : Anchor<CGRect>], nextValue: () -> [String : Anchor<CGRect>]) {
        value.merge(nextValue()) { $1 }
    }
}
