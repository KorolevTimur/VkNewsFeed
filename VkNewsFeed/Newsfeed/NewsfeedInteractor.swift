//
//  NewsfeedInteractor.swift
//  VkNewsFeed
//
//  Created by admin on 3/9/20.
//  Copyright (c) 2020 Timur Korolev. All rights reserved.
//

import UIKit

protocol NewsfeedBusinessLogic {
  func makeRequest(request: Newsfeed.Model.Request.RequestType)
}

class NewsfeedInteractor: NewsfeedBusinessLogic {

  var presenter: NewsfeedPresentationLogic?
  var service: NewsfeedService?
  
  func makeRequest(request: Newsfeed.Model.Request.RequestType) {
    if service == nil {
      service = NewsfeedService()
    }
    
    switch  request {
    
    case .some:
        print(".some interactor")
        presenter?.presentData(response: .some)
    case .getFeed:
        print(".getFeed interactor")
        presenter?.presentData(response: .presentNewsfeed)
    }
  }
  
}
