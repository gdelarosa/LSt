//
//  HomeListTableViewCell.swift
//  LarkSt_iOS_Test_GinaD
//
//  Created by Gina De La Rosa on 11/25/18.
//  Copyright © 2018 Gina De La Rosa. All rights reserved.
//

import UIKit
import SnapKit

class HomeListTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    var centerYConstraint: Constraint!
    let containerViewHeight: CGFloat = 468.0
    
    var setImage = [URL: UIImage]()
    
    let profileImage: UIButton = {
        let userImage = UIButton(frame: CGRect.init(x: -20, y: 7, width: 30, height: 30))
        userImage.setImage(#imageLiteral(resourceName: "avatarSmallListingAgent"), for: .normal)
        userImage.translatesAutoresizingMaskIntoConstraints = false
        userImage.contentMode = .scaleAspectFill
        userImage.setCornerRadius(amount: 0.5 * userImage.bounds.size.width)
        return userImage
    }()
    
    var homeImage: UIButton = {
        let homeButton = UIButton()
        homeButton.setImage(#imageLiteral(resourceName: "avatarUserpicMonica_2"), for: .normal)
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        homeButton.contentMode = .scaleAspectFill
        homeButton.setCornerRadius(amount: 20)
        homeButton.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return homeButton
    }()
    
    let isRentalImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "rectangle_2"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let commentButton: UIButton = {
        let comment = UIButton()
        comment.setImage(#imageLiteral(resourceName: "iconComment"), for: .normal)
        comment.translatesAutoresizingMaskIntoConstraints = false
        comment.contentMode = .scaleAspectFit
        return comment
    }()
    
    let addressText: UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = Color.Black.color
        text.font = Font.SFLight.of(size: 17)
        text.text = ""
        text.textAlignment = .left
        text.isScrollEnabled = false
        text.isEditable = false
        
        return text;
    }()

    let homeDescription: UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = Color.BlackOp.color
        text.font = Font.SFLight.of(size: 11)
        text.backgroundColor = Color.Clear.color
        text.text = ""
        text.textAlignment = .center
        text.isScrollEnabled = false
        text.isEditable = false
        
        return text;
    }()
    
    let cityText: UILabel = {
        var text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = Color.White.color
        text.font = Font.SFLight.of(size: 11)
        text.text = " "
        text.backgroundColor = Color.BlackOp.color
        text.layer.cornerRadius = 7.5
        text.layer.masksToBounds = true
        text.textAlignment = .center
        
        return text;
    }()
    
    let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.White.color
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        view.layer.shadowRadius = 2
        return view;
    }()
    
    let subView: UIView = {
        let large = UIView()
        large.backgroundColor = Color.Shadow.color
        return large
    }()
    
    // MARK: Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupContainerView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Cell Update with Data
    
    /// Updates cell information from model
    func updateCell(info: HomeListModel) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 0
        
        let result = formatter.string(from: NSNumber(value: info.price))
        let price = result! + " • "
        let bedrooms = String(format:"%.0f", info.numberBedrooms) + " Bed • "
        let bathrooms = String(format:"%.0f", info.numberBathrooms) + " Bath"
        
        addressText.text = info.addressText
        let leftSpaces = String(repeating: " ", count: 5)
        cityText.text =  "\(info.city)     " + leftSpaces
        homeDescription.text = price + bedrooms + bathrooms

        let homeImage:UIImage? = setImage[info.imageURL]

        if (homeImage == nil) {
            downloadImage(url: info.imageURL, profile: false)
        } else {
            self.homeImage.setImage(homeImage, for: .normal)
        }
        
        let profileImage:UIImage? = setImage[info.profileImageURL]
        
        if (profileImage == nil) {
            downloadImage(url: info.profileImageURL, profile: true)
        } else {
            self.profileImage.setImage(profileImage, for: .normal)
        }
        
        if (info.isRental == false) {
            isRentalImageView.image = UIImage(named: "rectangle_2")
        } else {
            isRentalImageView.image = UIImage(named: "rectangle")
        }
        
    }
    
    // MARK: Auto Layout

    /// View setup with constraints
    func setupContainerView() {
        addSubview(subView)
        addSubview(mainView)
        addSubview(addressText)
        addSubview(profileImage)
        addSubview(commentButton)
        addSubview(homeImage)
        addSubview(cityText)
        addSubview(homeDescription)
        addSubview(isRentalImageView)
        
        subView.snp.makeConstraints { (make) in
            make.topMargin.left.equalTo(10)
            make.right.bottomMargin.equalTo(-30)
            make.height.equalTo(450)
        }
        mainView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            self.centerYConstraint = make.centerY.equalTo(self).constraint
            make.height.equalTo(containerViewHeight)
        }
        homeImage.snp.makeConstraints { (make) in
            make.top.equalTo(mainView)
            make.right.equalTo(-20)
            make.left.equalTo(20)
            make.width.equalTo(mainView)
            make.height.equalTo(410)
        }
        profileImage.snp.makeConstraints { (make) in
            make.left.equalTo(50)
            make.bottom.equalTo(-30)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        commentButton.snp.makeConstraints { (make) in
            make.left.equalTo(69)
            make.bottom.equalTo(-25)
        }
        cityText.snp.makeConstraints { (make) in
            make.right.equalTo(-50)
            make.bottom.equalTo(-80)
        }
        addressText.snp.makeConstraints { (make) in
            make.left.equalTo(90)
            make.bottom.equalTo(-35)
        }
        isRentalImageView.snp.makeConstraints { (make) in
            make.left.equalTo(95)
            make.bottom.equalTo(-30)
        }
        homeDescription.snp.makeConstraints { (make) in
            make.left.equalTo(100)
            make.bottom.equalTo(-20)
        }
    }
    
    // MARK: Image Download
    
    ///Downloads Image Data
    func downloadImage(url: URL, profile: Bool) {
        let router = HomeListRouter()
        router.getData(url: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() {
                if (profile) {
                    let image:UIImage = UIImage(data: data)!
                    self.setImage[url] = image
                    self.profileImage.setImage(image, for: .normal)
                } else {
                    let image:UIImage = UIImage(data: data)!
                    self.setImage[url] = image
                    self.homeImage.setImage(image, for: .normal)
                }
            }
        }
    }
}
