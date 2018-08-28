//
//  AppDelegate.swift
//  CollectionKitWorkshop
//
//  Created by Luke Zhao on 2018-08-01.
//  Copyright © 2018 Luke Zhao. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func applicationDidFinishLaunching(_ application: UIApplication) {
    window = UIWindow()
    window?.rootViewController = ViewController()
//    window?.rootViewController = ViewControllerCK()
    window?.becomeKey()
  }
}

