//
//  ImageGalleryProvider.swift
//  CollectionKitWorkshop
//
//  Created by Luke Zhao on 2018-08-29.
//  Copyright © 2018 Luke Zhao. All rights reserved.
//

import UIKit
import CollectionKit

class ImageGalleryProvider: BasicProvider<Photo, PhotoCell> {
  let imageSource = ArrayDataSource<Photo>() {
    return $1.name
  }

  var photos: [Photo] {
    get { return imageSource.data }
    set { imageSource.data = newValue }
  }

  init() {
    super.init(
      dataSource: imageSource,
      viewSource: ClosureViewSource(viewUpdater: { (view, photo, index) in
        view.photo = photo
      }),
      sizeSource: { index, photo, size in
        let aspectRatio = photo.width / photo.height
        return CGSize(width: size.width, height: size.width / aspectRatio)
    })
  }
}
