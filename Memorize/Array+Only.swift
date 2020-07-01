//
//  Array+Only.swift
//  Memorize
//
//  Created by Raden Abdul Rahman on 6/30/20.
//  Copyright © 2020 Raden. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
