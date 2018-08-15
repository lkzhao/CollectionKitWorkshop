//
//  StorySection.swift
//  CollectionKitWorkshop
//
//  Created by Luke Zhao on 2018-08-08.
//  Copyright © 2018 Luke Zhao. All rights reserved.
//

import UIKit
import CollectionKit

struct Story {
  let id: String
  let userId: String
  var image: UIImage? {
    return UIImage(named: "user\(userId)")
  }
}

class StoryItemView: UIImageView {
  let borderView = UIImageView(image: #imageLiteral(resourceName: "storyBorder"))
  var story: Story? {
    didSet {
      guard let story = story else { return }
      image = story.image
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    clipsToBounds = true
    backgroundColor = .lightGray
    addSubview(borderView)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    borderView.frame = bounds
    layer.cornerRadius = bounds.width / 2
  }
}

class StorySectionProvider: BasicProvider<Story, StoryItemView> {
  let storyDataSource = ArrayDataSource<Story>(identifierMapper: { (index, story) in
    return story.id
  })
  var stories: [Story] = [] {
    didSet {
      storyDataSource.data = stories
    }
  }
  init() {
    let viewSource = ClosureViewSource(viewUpdater: { (itemView: StoryItemView, story: Story, index) in
      itemView.story = story
    })
    let sizeSource = { (index: Int, story: Story, collectionSize: CGSize) -> CGSize in
      return CGSize(width: 64, height: 64)
    }
    let layout = RowLayout(spacing: 10).inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    super.init(dataSource: storyDataSource,
               viewSource: viewSource,
               sizeSource: sizeSource,
               layout: layout)
  }
}
