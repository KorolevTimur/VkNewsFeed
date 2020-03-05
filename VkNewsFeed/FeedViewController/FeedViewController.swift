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
        networkService.getFeed()
        view.backgroundColor = .systemBlue
    }
}
