//
//  CG+CollectionKitWorkshop.swift
//  CollectionKitWorkshop
//
//  Created by Luke Zhao on 2018-08-29.
//  Copyright © 2018 Luke Zhao. All rights reserved.
//

import UIKit

extension CGPoint {
  func distance(_ point: CGPoint) -> CGFloat {
    return sqrt(pow(self.x - point.x, 2)+pow(self.y - point.y, 2))
  }
}
