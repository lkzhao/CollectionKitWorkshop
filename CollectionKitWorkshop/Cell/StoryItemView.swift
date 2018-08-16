//
//  StoryItemView.swift
//  CollectionKitWorkshop
//
//  Created by Luke Zhao on 2018-08-15.
//  Copyright © 2018 Luke Zhao. All rights reserved.
//

import UIKit

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
