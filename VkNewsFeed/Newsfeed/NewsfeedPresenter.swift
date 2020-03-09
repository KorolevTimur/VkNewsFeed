//
//  NewsfeedPresenter.swift
//  VkNewsFeed
//
//  Created by admin on 3/9/20.
//  Copyright (c) 2020 Timur Korolev. All rights reserved.
//

import UIKit

protocol NewsfeedPresentationLogic {
  func presentData(response: Newsfeed.Model.Response.ResponseType)
}

class NewsfeedPresenter: NewsfeedPresentationLogic {
  weak var viewController: NewsfeedDisplayLogic?
  
  func presentData(response: Newsfeed.Model.Response.ResponseType) {
  
    switch response {
 
    case .some:
        print(".some presenter")
        viewController?.displayData(viewModel: .displayNewsfeed)
    case .presentNewsfeed:
        print(".presentNewsfeed presenter")
        viewController?.displayData(viewModel: .displayNewsfeed)
    }
  }
  
}
