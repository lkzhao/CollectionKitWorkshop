//
//  PhotoCell.swift
//  ImageGallery
//
//  Created by Luke Zhao on 2018-08-21.
//  Copyright © 2018 Luke Zhao. All rights reserved.
//

import UIKit

class PhotoCell: UIView {
  let imageView = UIImageView()
  let label = UILabel()

  var photo: Photo? {
    didSet {
      guard let photo = photo else { return }
      imageView.image = UIImage(named: photo.name)
      label.text = "Photo by \(photo.username)"
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    addSubview(imageView)

    label.textColor = .white
    label.textAlignment = .right
    addSubview(label)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    imageView.frame = bounds
    label.frame = CGRect(x: 10, y: bounds.height - 30, width: bounds.width - 20, height: 20)
  }
}
