//
//  Stylesheet.swift
//  LarkSt_iOS_Test_GinaD
//
//  Created by Gina De La Rosa on 11/25/18.
//  Copyright © 2018 Gina De La Rosa. All rights reserved.
//

import UIKit

enum Color {
    case Black
    case Description
    case White
    case Background
    case Shadow
    
    var color: UIColor {
        switch self {
        case .Black:
            return UIColor.black
        case .Description:
            return UIColor(red:0.00, green:0.00, blue:0.00, alpha:0.8)
        case .White:
            return UIColor.white
        case .Background:
            return UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.0)
        case .Shadow:
            return UIColor(red:0.96, green:0.96, blue:0.96, alpha:0.1)
        }
    }
}

