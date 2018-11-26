//
//  Extensions.swift
//  LarkSt_iOS_Test_GinaD
//
//  Created by Gina De La Rosa on 11/25/18.
//  Copyright © 2018 Gina De La Rosa. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /// Navigation Setup
    func navigationBarView() {
        self.title = "Explore"
        let nav = self.navigationController?.navigationBar
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black, NSAttributedString.Key.font:Font.SFRegular.of(size: 27)]
        
        let leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "iconNavigationCreatePost.png"), style: .plain, target: self, action: #selector(HomeListViewController.clickCreatePost))
        self.navigationItem.leftBarButtonItem  = leftBarButtonItem
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "avatarUserpicJinYang.png"), style: .plain, target: self, action: #selector(HomeListViewController.clickProfile))
        
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.setBackgroundImage(UIImage(), for: .default)
        navigationBar?.shadowImage = UIImage()
        navigationBar?.isTranslucent = true
    }
}

