//
//  ViewController.swift
//  WeiboCollectionKit
//
//  Created by Luke Zhao on 2018-08-29.
//  Copyright © 2018 Luke Zhao. All rights reserved.
//

import UIKit
import CollectionKit

class ViewController: UIViewController {
  let collectionView = CollectionView()

  var stories: [Story] = TestData.getStories(count: 10)
  var posts: [Post] = TestData.getPosts(count: 10)

  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
    view.addSubview(collectionView)

    // this is where we setup the collectionView
    configureCollectionView()
  }

  // layout collection view to fill the entire screen space
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    collectionView.frame = view.bounds
  }
}

extension ViewController {
  func configureCollectionView() {
    // story section
    let storySection = getStorySection()

    // post section
    let postSection = getPostSection()

    // combine both story section and post section together
    collectionView.provider = ComposedProvider(sections: [
      storySection,
      postSection
      ])
  }

  func getStorySection() -> Provider {
    let storyProvider = BasicProvider(
      dataSource: ArrayDataSource(data: stories),
      viewSource: ClosureViewSource(viewUpdater: { (cell: StoryItemCell, data, index) in
        // 1. update StoryItemCell here
      }),
      sizeSource: { index, data, collectionSize in
        // 2. return size for each StoryItemCell here
        return .zero
    }
    )
    // 3. update post provider layout to include spacing

    // 7. fix scrolling issue

    return storyProvider
  }

  func getPostSection() -> Provider {
    let postProvider = BasicProvider(
      dataSource: ArrayDataSource(data: posts),
      viewSource: ClosureViewSource(viewUpdater: { (cell: PostItemCell, data, index) in
        // 4. update PostItemCell here
      }),
      sizeSource: { index, data, collectionSize in
        // 5. return size for each StoryItemCell here
        return .zero
    }
    )
    // 6. update post provider layout to include spacing

    return postProvider
  }
}

