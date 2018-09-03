//
//  ViewControllerCK.swift
//  ImageGallery
//
//  Created by Luke Zhao on 2018-08-28.
//  Copyright © 2018 Luke Zhao. All rights reserved.
//

import UIKit
import CollectionKit

class ViewController: UIViewController {
  let collectionView = CollectionView()

  override func viewDidLoad() {
    super.viewDidLoad()

    collectionView.indicatorStyle = .white
    collectionView.backgroundColor = .black
    view.addSubview(collectionView)

    let provider = ImageGalleryProvider()
    provider.layout = FlowLayout() // 2. update provider's layout
    provider.photos = testPhotos
    collectionView.provider = provider
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    collectionView.frame = view.bounds
  }
}

class MosaicLayout: VerticalSimpleLayout {
  override func simpleLayout(context: LayoutContext) -> [CGRect] {
    var frames: [CGRect] = []

    // 1. generate frames for each cell

    return frames
  }

  func getFrame(rowHeight: CGFloat, index: Int, collectionSize: CGSize) -> CGRect {
    let groupIndex = index % 6
    var frame = CGRect.zero

    // determine size
    switch groupIndex {
    case 1, 3:
      frame.size = CGSize(width: collectionSize.width / 3 * 2, height: rowHeight * 2)
    default:
      frame.size = CGSize(width: collectionSize.width / 3, height: rowHeight)
    }

    // determine x value
    switch groupIndex {
    case 0, 2, 3:
      frame.origin.x = 0
    case 1:
      frame.origin.x = collectionSize.width / 3
    default:
      frame.origin.x = collectionSize.width / 3 * 2
    }

    // determine y value
    let yBaseline = rowHeight * 2 * CGFloat(index / 3)
    switch groupIndex {
    case 2, 5:
      frame.origin.y = yBaseline + rowHeight
    default:
      frame.origin.y = yBaseline
    }

    return frame
  }
}

