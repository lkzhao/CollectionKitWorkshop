//
//  TestData.swift
//  CollectionKitWorkshop
//
//  Created by Luke Zhao on 2018-08-08.
//  Copyright © 2018 Luke Zhao. All rights reserved.
//

import Foundation

let testContent = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc rutrum vestibulum tincidunt. Nullam at nisl in quam egestas consequat sit amet non metus. Quisque nec tortor non nibh facilisis porttitor. Integer elementum nisi et orci venenatis volutpat. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse eget ex sollicitudin, mattis lectus blandit, hendrerit ligula. Cras accumsan, enim ut accumsan interdum, mauris erat bibendum turpis, a vulputate enim ligula non risus. Nunc magna erat, vestibulum sit amet velit non, dictum bibendum nibh.
"""

struct TestData {
  static func getPosts(count: Int) -> [Post] {
    return (0..<count).map { Post(id: "\($0)", userId: "\($0)", content: testContent) }
  }
  static func getStories(count: Int) -> [Story] {
    return (0..<count).map { Story(id: "\($0)", userId: "\($0)") }
  }
}
