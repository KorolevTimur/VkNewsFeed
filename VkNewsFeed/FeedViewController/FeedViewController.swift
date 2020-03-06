//
//  FeedViewController.swift
//  VkNewsFeed
//
//  Created by admin on 3/4/20.
//  Copyright © 2020 Timur Korolev. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    private let networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let params = ["filters": "post, photo"]
        networkService.request(path: API.newsFeed, params: params) { (data, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            guard let data = data else { return }
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            print(json)
            
        }
        view.backgroundColor = .systemBlue
    }
}
