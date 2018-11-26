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
    
    var setImage = [URL: UIImage]()
    
    let profileImage: UIButton = {
        let userImage = UIButton()
        userImage.setImage(#imageLiteral(resourceName: "avatarSmallListingAgent"), for: .normal)
        userImage.translatesAutoresizingMaskIntoConstraints = false
        userImage.contentMode = .scaleAspectFill
        userImage.setCornerRadius(amount: 20)
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
        text.textColor = Color.Description.color
        text.font = Font.SFLight.of(size: 11)
        text.backgroundColor = UIColor.clear
        text.text = ""
        text.textAlignment = .center
        text.isScrollEnabled = false
        text.isEditable = false
        
        return text;
    }()
    
    let cityText: UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false;
        text.textColor = Color.City.color
        text.font = Font.SFLight.of(size: 11)
        text.text = ""
        text.backgroundColor = Color.Black.color
        text.backgroundColor?.withAlphaComponent(0.5)
        text.layer.cornerRadius = 10
        text.clipsToBounds = true
        text.textAlignment = .center
        text.isScrollEnabled = false
        text.isEditable = false
        
        return text;
    }()
    
    let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 20
        return view;
    }()
    
    let shadowView: UIView = {
        let large = UIView()
        large.backgroundColor = Color.Background.color
        large.layer.shadowColor = UIColor.gray.cgColor
        large.layer.shadowOpacity = 0.8
        large.layer.shadowOffset = CGSize(width: 5, height: 15)
        large.layer.shadowRadius = 10
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
    
    /// Updates cell information from model
    func updateCell(info: HomeListModel) {
        
        addressText.text = info.addressText

        homeDescription.text = "$" + String(format:"%.0f", info.price) + " • " + String(format:"%.0f", info.numberBedrooms) + " Bed • " + String(format:"%.0f", info.numberBathrooms) + " Bath"

        cityText.text = info.city

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

    /// View setup with constraints
    func setupContainerView() {
        addSubview(shadowView)
        addSubview(mainView)
        addSubview(addressText)
        addSubview(profileImage)
        addSubview(commentButton)
        addSubview(homeImage)
        addSubview(cityText)
        addSubview(homeDescription)
        addSubview(isRentalImageView)
        
        shadowView.snp.makeConstraints { (make) in
            make.topMargin.left.equalTo(20)
            make.right.bottomMargin.equalTo(-30)
            make.height.equalTo(470)
        }
        mainView.snp.makeConstraints { (make) in
           make.topMargin.left.equalTo(20)
           make.right.bottomMargin.equalTo(-20)
           make.height.equalTo(490)
        }
        homeImage.snp.makeConstraints {
            (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(468)
        }
        profileImage.snp.makeConstraints { (make) in
            make.left.equalTo(30)
            make.bottom.equalTo(-20)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        commentButton.snp.makeConstraints { (make) in
            make.left.equalTo(49)
            make.bottom.equalTo(-15)
        }
        cityText.snp.makeConstraints {
            (make) in
            make.right.equalTo(-30)
            make.bottom.equalTo(-70)
        }
        addressText.snp.makeConstraints {
            (make) in
            make.left.equalTo(70)
            make.bottom.equalTo(-25)
        }
        isRentalImageView.snp.makeConstraints {
            (make) in
            make.left.equalTo(75)
            make.bottom.equalTo(-20)
        }
        homeDescription.snp.makeConstraints {
            (make) in
            make.left.equalTo(80)
            make.bottom.equalTo(-10)
        }
    }
    
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
