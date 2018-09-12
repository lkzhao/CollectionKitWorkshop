//
//  ViewController.swift
//  ImageGallery
//
//  Created by Luke Zhao on 2018-08-21.
//  Copyright © 2018 Luke Zhao. All rights reserved.
//

import UIKit

let photoCellIdentifier = "photoCellIdentifier"

class ViewController: UIViewController {
  let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIMosaicLayout())

  var photos: [Photo] = testPhotos

  override func viewDidLoad() {
    super.viewDidLoad()

    collectionView.indicatorStyle = .white
    collectionView.backgroundColor = .black
    collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: photoCellIdentifier)
    collectionView.delegate = self
    collectionView.dataSource = self
    view.addSubview(collectionView)
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    collectionView.frame = view.bounds
  }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return photos.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photoCellIdentifier, for: indexPath) as! PhotoCell
    cell.photo = photos[indexPath.item]
    return cell
  }
}

class UIMosaicLayout: UICollectionViewLayout {
  fileprivate var attributes = [UICollectionViewLayoutAttributes]()

  fileprivate var contentSize: CGSize = .zero

  override var collectionViewContentSize: CGSize {
    return contentSize
  }

  override func prepare() {
    guard let collectionView = collectionView else {
      return
    }
    attributes.removeAll()
    
    var contentFrame: CGRect = .zero
    let rowHeight: CGFloat = 200

    for item in 0..<collectionView.numberOfItems(inSection: 0) {

      let frame = getFrame(rowHeight: rowHeight, index: item, collectionSize: collectionView.bounds.size)

      let attr = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: item, section: 0))
      attr.frame = frame
      attributes.append(attr)

      contentFrame = contentFrame.union(frame)

    }

    contentSize = contentFrame.size
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

  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()

    // Loop through the cache and look for items in the rect
    for attributes in attributes {
      if attributes.frame.intersects(rect) {
        visibleLayoutAttributes.append(attributes)
      }
    }

    return visibleLayoutAttributes
  }
}
