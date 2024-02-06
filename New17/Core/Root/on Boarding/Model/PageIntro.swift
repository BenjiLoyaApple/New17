//
//  PageIntro.swift
//  NewForSwiftUI
//
//  Created by Benji Loya on 03/04/2023.
//

import SwiftUI

struct PageIntro: Identifiable, Hashable {
    var id: UUID = .init()
    var introAssetImage: String
    var tittle: String
    var subTittle: String
    var displayysAction : Bool = false
}

var pageIntros: [PageIntro] = [
    .init(introAssetImage: "img 1", tittle: "Wellcome to Planet App:", subTittle: "The best way to explore space."),
    .init(introAssetImage: "img 2", tittle: "Professional app:", subTittle: "Create, save, organize."),
    .init(introAssetImage: "img 3", tittle: "Let's\nGet Started", subTittle: "to register for an account, enter your details", displayysAction: true),


]
