//
//  Post.swift
//  CollectionKitWorkshop
//
//  Created by Luke Zhao on 2018-08-15.
//  Copyright © 2018 Luke Zhao. All rights reserved.
//

import UIKit

struct Post {
  let id: String
  let userId: String
  let content: String
  var image: UIImage? {
    return UIImage(named: "user\(userId)")
  }
  var name: String {
    return "用户\(userId)"
  }
}
