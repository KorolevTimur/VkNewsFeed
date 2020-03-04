//
//  AuthViewController.swift
//  VkNewsFeed
//
//  Created by admin on 3/4/20.
//  Copyright © 2020 Timur Korolev. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    
    private var authService: AuthService!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        authService = SceneDelegate.shared().authService
        view.backgroundColor = .red
    }

    @IBAction func signInTouch(_ sender: UIButton) {
        authService.wakeUpSession()
    }
    
}

