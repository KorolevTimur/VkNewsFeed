//
//  NewsfeedCellLayoutCalculator.swift
//  VkNewsFeed
//
//  Created by admin on 3/16/20.
//  Copyright © 2020 Timur Korolev. All rights reserved.
//

import Foundation
import UIKit

protocol FeedCellLayoutCalculatorProtocol {
    func sizes(postText: String?, phootoAttachment: FeedCellPhotoAttachmentViewModel?) -> FeedCellSizes
}

struct Sizes: FeedCellSizes {
    var postLabelFrame: CGRect
    var attachmentFrame: CGRect
}

final class NewsfeedCellLayoutCalculator: FeedCellLayoutCalculatorProtocol {
    
    private let screenWidth : CGFloat
    
    init(screenWidth: CGFloat = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)) {
        self.screenWidth = screenWidth
    }
    
    func sizes(postText: String?, phootoAttachment: FeedCellPhotoAttachmentViewModel?) -> FeedCellSizes {
        return Sizes(postLabelFrame: CGRect.zero, attachmentFrame: CGRect.zero)
    }
    
}
