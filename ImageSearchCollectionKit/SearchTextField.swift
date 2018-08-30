//
//  SearchTextField.swift
//  ImageSearchCollectionKit
//
//  Created by Luke Zhao on 2018-08-29.
//  Copyright © 2018 Luke Zhao. All rights reserved.
//

import UIKit

class SearchTextField: UITextField {
  override var placeholder: String? {
    get { return attributedPlaceholder?.string }
    set {
      attributedPlaceholder = NSAttributedString(string: newValue ?? "", attributes: [NSAttributedStringKey.foregroundColor : UIColor.gray])
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)

    backgroundColor = UIColor(white: 0.9, alpha: 1.0)

    textColor = UIColor(white: 0.3, alpha: 1.0)
    font = UIFont.boldSystemFont(ofSize: 20)
    tintColor = .red

    autocorrectionType = .no
    autocapitalizationType = .none

    layer.cornerRadius = 8
  }

  override func textRect(forBounds bounds: CGRect) -> CGRect {
    let sizeInset: CGFloat = 14
    return UIEdgeInsetsInsetRect(bounds, UIEdgeInsets(top: 8, left: sizeInset, bottom: 8, right: sizeInset))
  }

  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    return textRect(forBounds: bounds)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
