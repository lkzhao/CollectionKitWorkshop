//
//  ViewController.swift
//  ImageGallery
//
//  Created by Luke Zhao on 2018-08-21.
//  Copyright © 2018 Luke Zhao. All rights reserved.
//

import UIKit
import CollectionKit

class ViewController: UIViewController {
  let collectionView = CollectionView()

  override func viewDidLoad() {
    super.viewDidLoad()

    collectionView.backgroundColor = .black
    view.addSubview(collectionView)

    let provider = BasicProvider(
      dataSource: ArrayDataSource(data: photos),
      viewSource: ClosureViewSource(viewUpdater: { (view: PhotoCell, photo, index) in
        view.photo = photo
      }),
      sizeSource: { index, photo, size in
        let aspectRatio = photo.width / photo.height
        return CGSize(width: size.height * aspectRatio, height: size.height)
    })

    provider.layout = FlowLayout()
    collectionView.provider = provider
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    collectionView.frame = view.bounds
  }
}

