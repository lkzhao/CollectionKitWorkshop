//
//  StorySectionProvider.swift
//  CollectionKitWorkshop
//
//  Created by Luke Zhao on 2018-08-08.
//  Copyright © 2018 Luke Zhao. All rights reserved.
//

import UIKit
import CollectionKit

class StorySectionProvider: BasicProvider<Story, StoryItemCell> {
  let storyDataSource = ArrayDataSource<Story>(identifierMapper: { (index, story) in
    return story.id
  })
  var stories: [Story] = [] {
    didSet {
      storyDataSource.data = stories
    }
  }
  init() {
    let viewSource = ClosureViewSource(viewUpdater: { (itemView: StoryItemCell, story: Story, index) in
      itemView.story = story
    })
    let sizeSource = { (index: Int, story: Story, collectionSize: CGSize) -> CGSize in
      return CGSize(width: 64, height: 64)
    }
    let layout = FlowLayout(spacing: 10).inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    super.init(dataSource: storyDataSource,
               viewSource: viewSource,
               sizeSource: sizeSource,
               layout: layout)
  }
}
