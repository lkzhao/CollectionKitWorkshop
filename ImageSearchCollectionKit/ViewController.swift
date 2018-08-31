//
//  ViewController.swift
//  ImageSearchCollectionKit
//
//  Created by Luke Zhao on 2018-08-29.
//  Copyright © 2018 Luke Zhao. All rights reserved.
//

import UIKit
import CollectionKit

class ViewController: UIViewController {
  let collectionView = CollectionView()

  let searchTextField = SearchTextField()
  let navbarProvider = SimpleViewProvider()
  let imageGalleryProvider = ImageGalleryProvider()
  let mainProvider = ComposedProvider()

  override func viewDidLoad() {
    super.viewDidLoad()

    // setup collectionView
    collectionView.provider = mainProvider
    collectionView.backgroundColor = .white
    view.addSubview(collectionView)

    // observe text change
    searchTextField.delegate = self
    NotificationCenter.default.addObserver(self, selector: #selector(textFieldDidChangeText),
                                           name: .UITextFieldTextDidChange, object: searchTextField)

    // configure navbar
    navbarProvider.views = [searchTextField]
    navbarProvider.sizeStrategy = (.fill, .absolute(40))
    navbarProvider.layout = RowLayout().inset(by: UIEdgeInsets(top: 20, left: 10, bottom: 15, right: 10))

    // configure image gallery section
    imageGalleryProvider.layout = WaterfallLayout(columns: 2, spacing: 10)
      .inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    imageGalleryProvider.photos = testPhotos

    // setup entire screen
    mainProvider.animator = RotateAnimator()
    mainProvider.sections = [
      navbarProvider,
      imageGalleryProvider
    ]
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    collectionView.frame = view.bounds
  }

  @objc func textFieldDidChangeText() {
    let text = searchTextField.text ?? ""
    if text.isEmpty {
      imageGalleryProvider.photos = testPhotos
    } else {
      imageGalleryProvider.photos = testPhotos.filter { $0.username.lowercased().contains(text.lowercased()) }
    }
  }
}

extension ViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    _ = textField.resignFirstResponder()
    return true
  }
}

class RotateAnimator: Animator {
  override func insert(collectionView: CollectionView, view: UIView, at: Int, frame: CGRect) {
    view.frame = frame
    guard collectionView.isReloading else {
      view.layer.transform = CATransform3DIdentity
      view.alpha = 1
      return
    }
    var t = CATransform3DIdentity
    t.m34 = -1 / 500
    t = CATransform3DTranslate(t, 0, 0, -100)
    t = CATransform3DScale(t, 0.8, 0.8, 1.0)
    t = CATransform3DRotate(t, 1.0, 1, 0, 0)
    view.layer.transform = t
    view.alpha = 0
    let distance = frame.origin.distance(.zero) / CGPoint(x: collectionView.visibleFrame.maxX, y: collectionView.visibleFrame.maxY).distance(.zero) / 2
    animate(delay: TimeInterval(distance)) {
      view.layer.transform = CATransform3DIdentity
      view.alpha = 1
    }
  }

  override func delete(collectionView: CollectionView, view: UIView) {
    var t = CATransform3DIdentity
    t.m34 = -1 / 500
    t = CATransform3DTranslate(t, 0, 0, -100)
    t = CATransform3DScale(t, 0.8, 0.8, 1.0)
    t = CATransform3DRotate(t, 1.0, 1, 0, 0)
    animate(animations: {
        view.alpha = 0
        view.layer.transform = t
      }, completion: { _ in
        view.recycleForCollectionKitReuse()
      })
  }

  override func update(collectionView: CollectionView, view: UIView, at: Int, frame: CGRect) {
    let frameCenter = CGPoint(x: frame.midX, y: frame.midY)
    if view.center != frameCenter {
      animate {
        view.center = frameCenter
      }
    }
  }

  func animate(delay: TimeInterval = 0, animations: @escaping () -> Void) {
    animate(delay: delay, animations: animations, completion: nil)
  }

  func animate(delay: TimeInterval = 0, animations: @escaping () -> Void, completion: ((Bool) -> Void)?) {
    UIView.animate(withDuration: 1,
                   delay: delay,
                   usingSpringWithDamping: 0.8,
                   initialSpringVelocity: 0,
                   options: [.allowUserInteraction],
                   animations: animations,
                   completion: completion)
  }
}
