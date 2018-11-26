//
//  Extensions.swift
//  LarkSt_iOS_Test_GinaD
//
//  Created by Gina De La Rosa on 11/25/18.
//  Copyright © 2018 Gina De La Rosa. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /// Navigation View Setup
    func navigationBarView() {
        
        self.title = "Explore"
        let nav = self.navigationController?.navigationBar
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black, NSAttributedString.Key.font:Font.SFRegular.of(size: 27)]
        
        let leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "iconNavigationCreatePost.png"), style: .plain, target: self, action: #selector(HomeListViewController.clickCreatePost))
        self.navigationItem.leftBarButtonItem  = leftBarButtonItem
        
        let viewFN = UIView(frame: CGRect.init(x: 0, y: 0, width: 20, height: 50))
        let rightButton = UIButton(frame: CGRect.init(x: -20, y: 7, width: 30, height: 30))
        rightButton.setImage(UIImage(named: "avatarUserpicJinYang.png"), for: UIControl.State.normal)
        rightButton.setCornerRadius(amount: 0.5 * rightButton.bounds.size.width)
        
        rightButton.addTarget(self, action: #selector(HomeListViewController.clickProfile), for: UIControl.Event.touchUpInside)
        viewFN.addSubview(rightButton)
        let rightBarButton = UIBarButtonItem(customView: viewFN)
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.setBackgroundImage(UIImage(), for: .default)
        navigationBar?.shadowImage = UIImage()
        navigationBar?.isTranslucent = true
    }
}

