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
    let dateFormatter: DateFormatter = {
       let dt = DateFormatter()
        dt.locale = Locale(identifier: "ru_RU")
        dt.dateFormat = "d MMM 'в' HH:mm"
        return dt
    }()
    
  
  func presentData(response: Newsfeed.Model.Response.ResponseType) {
  
    switch response {
    case .presentNewsfeed(let feed):
        
        let cells = feed.items.map { (feedItem) in
            cellViewModel(from: feedItem, profiles: feed.profiles, groups: feed.groups)
        }
        
        let feedViewModel = FeedViewModel.init(cells: cells)
        
        viewController?.displayData(viewModel: Newsfeed.Model.ViewModel.ViewModelData.displayNewsfeed(feedViewModel: feedViewModel))
    }
  }
    
    private func cellViewModel(from feedItem: FeedItem, profiles: [Profile], groups: [Group]) -> FeedViewModel.Cell {
        
        let profile = self.profile(for: feedItem.sourceId, profiles: profiles, groups: groups)
        
        let date = Date(timeIntervalSince1970: feedItem.date)
        let dataTitle = dateFormatter.string(from: date)
        
        
        return FeedViewModel.Cell.init(iconUrlString: profile.photo,
                                name: profile.name,
                                date: dataTitle,
                                text: feedItem.text,
                                likes: String(feedItem.likes?.count ?? 0),
                                comments: String(feedItem.comments?.count ?? 0),
                                shares: String(feedItem.reposts?.count ?? 0),
                                views: String(feedItem.views?.count ?? 0))
    }
  
    private func profile(for sourseId: Int, profiles: [Profile], groups: [Group]) -> ProfileRepresentable {
        
        let profilesOrGroups: [ProfileRepresentable] = sourseId >= 0 ? profiles : groups
        let normalSourseId = sourseId >= 0 ? sourseId : -sourseId
        let profileRepresentable = profilesOrGroups.first { (myProfileRepresentable) -> Bool in
            myProfileRepresentable.id == normalSourseId
        }
        return profileRepresentable!
    }
}
