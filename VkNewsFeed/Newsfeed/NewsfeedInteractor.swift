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
    
    private var revealPostIds = [Int]()
    private var feedResponse: FeedResponse?
    
    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
  
  func makeRequest(request: Newsfeed.Model.Request.RequestType) {
    if service == nil {
      service = NewsfeedService()
    }
    
    switch  request {
        
    case .getNewsfeed:
        fetcher.getFeed { [weak self] (feedResponse) in
            self?.feedResponse = feedResponse
            self?.presentFeed()
        }
    case .revealPostIds(let postId):
        revealPostIds.append(postId)
        presentFeed()
    case .getUser:
        fetcher.getUser { (userResponse) in
            self.presenter?.presentData(response: Newsfeed.Model.Response.ResponseType.presentUserInfo(user: userResponse))
        }
    }
  }
    private func presentFeed() {
        guard let feedResponse = feedResponse else { return }
        presenter?.presentData(response: Newsfeed.Model.Response.ResponseType.presentNewsfeed(feed: feedResponse, revealedPostIds: revealPostIds))
    }
  
}
