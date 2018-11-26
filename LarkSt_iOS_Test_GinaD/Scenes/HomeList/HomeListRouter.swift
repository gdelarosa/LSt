//
//  HomeListRouter.swift
//  LarkSt_iOS_Test_GinaD
//
//  Created by Gina De La Rosa on 11/25/18.
//  Copyright © 2018 Gina De La Rosa. All rights reserved.
//

import UIKit

class HomeListRouter {
    
    /// Retrieves Data
    func getData(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }
}
