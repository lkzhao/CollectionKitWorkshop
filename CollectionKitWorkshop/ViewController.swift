//
//  ViewController.swift
//  CollectionKitWorkshop
//
//  Created by Luke Zhao on 2018-08-01.
//  Copyright © 2018 Luke Zhao. All rights reserved.
//

import UIKit
import CollectionKit

class ViewController: UIViewController {
  let collectionView = CollectionView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
    view.addSubview(collectionView)
    updateSections()
  }
  
  func updateSections() {
    let storySectionProvider = StorySectionProvider()
    storySectionProvider.stories = TestData.getStories(count: 3)
    
    let postSectionProvider = PostSectionProvider()
    postSectionProvider.posts = TestData.getPosts(count: 10)
    
    let announcementProvider = AnnouncementSectionProvider()
    announcementProvider.announcement = "13条新消息未读"
    
    collectionView.provider = ComposedProvider(sections: [
        announcementProvider,
        storySectionProvider,
        postSectionProvider
      ])
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    collectionView.frame = view.bounds
  }
}


