//
//  ViewController.swift
//  CollectionKitWorkshop
//
//  Created by Luke Zhao on 2018-08-01.
//  Copyright © 2018 Luke Zhao. All rights reserved.
//

import UIKit
import CollectionKit

let storyItemCellIdentifier = "storyItemCellIdentifier"
let postItemCellIdentifier = "postItemCellIdentifier"
let storyCellIdentifier = "storyCellIdentifier"

class StoryCell: UICollectionViewCell {
  let layout = UICollectionViewFlowLayout()
  let collectionView: UICollectionView

  var stories: [Story] = [] {
    didSet {
      collectionView.reloadData()
    }
  }

  override init(frame: CGRect) {
    collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
    super.init(frame: frame)

    layout.scrollDirection = .horizontal
    layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)

    collectionView.backgroundColor = .clear
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(StoryItemCell.self, forCellWithReuseIdentifier: storyItemCellIdentifier)
    addSubview(collectionView)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    collectionView.frame = bounds
  }
}

extension StoryCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return stories.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: storyItemCellIdentifier, for: indexPath) as! StoryItemCell
    cell.story = stories[indexPath.item]
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 64, height: 64)
  }
}

class ViewController: UIViewController {
  let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

  var stories: [Story] = TestData.getStories(count: 10)
  var posts: [Post] = TestData.getPosts(count: 10)

  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
    collectionView.register(StoryCell.self, forCellWithReuseIdentifier: storyCellIdentifier)
    collectionView.register(PostItemCell.self, forCellWithReuseIdentifier: postItemCellIdentifier)
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
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 2
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return section == 0 ? 1 : posts.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if indexPath.section == 0 {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: storyCellIdentifier, for: indexPath) as! StoryCell
      cell.stories = stories
      return cell
    } else {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: postItemCellIdentifier, for: indexPath) as! PostItemCell
      cell.post = posts[indexPath.item]
      return cell
    }
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if indexPath.section == 0 {
      return CGSize(width: collectionView.bounds.width, height: 104)
    } else {
      return CGSize(width: collectionView.bounds.width, height: 200)
    }
  }
}

