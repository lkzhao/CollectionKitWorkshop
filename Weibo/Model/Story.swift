//
//  Story.swift
//  CollectionKitWorkshop
//
//  Created by Luke Zhao on 2018-08-15.
//  Copyright © 2018 Luke Zhao. All rights reserved.
//

import UIKit

struct Story {
  let id: String
  let userId: String
  var image: UIImage? {
    return UIImage(named: "user\(userId)")
  }
}
