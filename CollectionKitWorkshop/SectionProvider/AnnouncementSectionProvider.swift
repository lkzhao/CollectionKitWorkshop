//
//  AnnouncementSectionProvider.swift
//  CollectionKitWorkshop
//
//  Created by Luke Zhao on 2018-08-08.
//  Copyright © 2018 Luke Zhao. All rights reserved.
//

import UIKit
import CollectionKit

class AnnouncementSectionProvider: SimpleViewProvider {
  let label = UILabel()

  var announcement: String? {
    didSet {
      label.text = announcement
    }
  }

  init() {
    label.textAlignment = .center
    label.backgroundColor = UIColor(red: 1.0, green: 0.8, blue: 0.5, alpha: 1.0)
    label.textColor = UIColor(red: 1.0, green: 0.6, blue: 0.0, alpha: 1.0)
    super.init(views: [label], sizeStrategy: (.fill, .absolute(30)))
  }
}
