//
//  HomeListViewController.swift
//  LarkSt_iOS_Test_GinaD
//
//  Created by Gina De La Rosa on 11/25/18.
//  Copyright © 2018 Gina De La Rosa. All rights reserved.
//

import UIKit
import SnapKit

class HomeListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Properties
    let mainTableView = UITableView()
    var listings: [HomeListModel] = []
    let cellIdentifier: String = "cellID"
    
    let navBarImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Group"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        listings = HomeListModel.getTestFeed()
        setupTableView()
        navigationBarView()
        setupNavImage()
    }
    
    /// Navigation Bar Image Setup
    private func setupNavImage() {
        let navBar = navigationController
        navBar!.view.backgroundColor = .clear
        self.view.addSubview(navBarImage)
        navBarImage.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.height.equalTo(100)
            make.width.equalTo(400)
        }
    }
    
    /// TableView Setup
    private func setupTableView() {
        mainTableView.showsVerticalScrollIndicator = false
        mainTableView.register(HomeListTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        view.addSubview(mainTableView)
        mainTableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        mainTableView.dataSource = self
        mainTableView.delegate = self
        mainTableView.separatorColor = UIColor.clear
        mainTableView.separatorStyle = .none
        mainTableView.backgroundColor = Color.Background.color
        
    }
    
    // MARK: Button Actions
    @objc func clickCreatePost(){
        print("Create Post Button Selected")
    }
    
    @objc func clickProfile() {
        print("Profile Button Selected")
    }
    
    @objc func clickToComment() {
        print("Comment Button Selected")
    }
    
    @objc func clickImage() {
        print("Image Selected")
    }
}

extension HomeListViewController {
    
    // MARK: TableView Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! HomeListTableViewCell
        cell.updateCell(info: listings[indexPath.row])
        
        cell.profileImage.addTarget(self, action: #selector(self.clickProfile), for: .touchUpInside)
        cell.homeImage.addTarget(self, action: #selector(self.clickImage), for: .touchUpInside)
        cell.commentButton.addTarget(self, action: #selector(self.clickToComment), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
}



