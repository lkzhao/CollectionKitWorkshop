//
//  PostItemView.swift
//  CollectionKitWorkshop
//
//  Created by Luke Zhao on 2018-08-08.
//  Copyright © 2018 Luke Zhao. All rights reserved.
//

import UIKit

class PostItemView: UIView {
  let avatarView = UIImageView()
  let nameLabel = UILabel()
  let contentLabel = UILabel()

  var post: Post? {
    didSet {
      guard let post = post else { return }
      avatarView.image = post.image
      nameLabel.text = post.name
      contentLabel.text = post.content
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white

    avatarView.clipsToBounds = true
    avatarView.layer.cornerRadius = 22
    addSubview(avatarView)

    nameLabel.textColor = UIColor(red: 1.0, green: 0.6, blue: 0.0, alpha: 1.0)
    addSubview(nameLabel)

    contentLabel.numberOfLines = 0
    addSubview(contentLabel)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    avatarView.frame = CGRect(x: 10, y: 10, width: 44, height: 44)
    nameLabel.frame = CGRect(x: 64, y: 10, width: bounds.width - 64, height: 20)
    contentLabel.frame = CGRect(x: 64, y: 40, width: bounds.width - 74, height: bounds.height - 50)
  }
}
