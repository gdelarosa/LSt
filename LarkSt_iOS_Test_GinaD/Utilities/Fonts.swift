//
//  Fonts.swift
//  LarkSt_iOS_Test_GinaD
//
//  Created by Gina De La Rosa on 11/25/18.
//  Copyright © 2018 Gina De La Rosa. All rights reserved.
//

import UIKit

enum Font: String {
    case SFRegular = "SFProDisplay-Regular"
    case SFLight = "SFProDisplay-Light"
    
    func of(size: CGFloat) -> UIFont {
        return UIFont(name: rawValue, size: size)!
    }
}
