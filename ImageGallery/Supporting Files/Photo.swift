//
//  Photo.swift
//  ImageGallery
//
//  Created by Luke Zhao on 2018-08-21.
//  Copyright © 2018 Luke Zhao. All rights reserved.
//

import UIKit

struct Photo: Codable {
  let name: String
  let photoURL: String
  let userURL: String
  let username: String
  let width: CGFloat
  let height: CGFloat
}

let testPhotos = [
  Photo(
    name: "xq6tKtQYNJI",
    photoURL: "https://unsplash.com/photos/xq6tKtQYNJI?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    userURL: "https://unsplash.com/@messisorder?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    username: "Oscar  Söderlund",
    width: 1080.0,
    height: 721.0
  ),
  Photo(
    name: "AjRxpTzZ-SU",
    photoURL: "https://unsplash.com/photos/AjRxpTzZ-SU?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    userURL: "https://unsplash.com/@thomasschweighofer_?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    username: "Thomas Schweighofer",
    width: 1080.0,
    height: 608.0
  ),
  Photo(
    name: "HG419n_6Fro",
    photoURL: "https://unsplash.com/photos/HG419n_6Fro?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    userURL: "https://unsplash.com/@hkaul?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    username: "H K",
    width: 1080.0,
    height: 718.0
  ),
  Photo(
    name: "DBcAm_g8DMM",
    photoURL: "https://unsplash.com/photos/DBcAm_g8DMM?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    userURL: "https://unsplash.com/@swifteagle?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    username: "Felipe Palacio",
    width: 1080.0,
    height: 720.0
  ),
  Photo(
    name: "Z2jOnZzkw_U",
    photoURL: "https://unsplash.com/photos/Z2jOnZzkw_U?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    userURL: "https://unsplash.com/@thesollers?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    username: "Anton Darius | @theSollers",
    width: 1080.0,
    height: 720.0
  ),
  Photo(
    name: "5oBK0qdJRJM",
    photoURL: "https://unsplash.com/photos/5oBK0qdJRJM?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    userURL: "https://unsplash.com/@shravii?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    username: "Shravan Vijayabaskaran",
    width: 1080.0,
    height: 720.0
  ),
  Photo(
    name: "iKE6oWJ_hxM",
    photoURL: "https://unsplash.com/photos/iKE6oWJ_hxM?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    userURL: "https://unsplash.com/@josephyates_?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    username: "Joe Yates",
    width: 1080.0,
    height: 720.0
  ),
  Photo(
    name: "ImhjEeh7pZg",
    photoURL: "https://unsplash.com/photos/ImhjEeh7pZg?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    userURL: "https://unsplash.com/@leio?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    username: "Leio McLaren (@leiomclaren)",
    width: 1080.0,
    height: 1350.0
  ),
  Photo(
    name: "qWQGk5mdVBU",
    photoURL: "https://unsplash.com/photos/qWQGk5mdVBU?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    userURL: "https://unsplash.com/@vinhan?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    username: "An Tran",
    width: 1080.0,
    height: 399.0
  ),
  Photo(
    name: "X1PmVt1Smyg",
    photoURL: "https://unsplash.com/photos/X1PmVt1Smyg?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    userURL: "https://unsplash.com/@yuanthirdy?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    username: "Yuan Thirdy",
    width: 1080.0,
    height: 608.0
  ),
  Photo(
    name: "qPaI1TALouQ",
    photoURL: "https://unsplash.com/photos/qPaI1TALouQ?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    userURL: "https://unsplash.com/@allaboutmelisa?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    username: "Melisa Popanicic",
    width: 1080.0,
    height: 719.0
  ),
  Photo(
    name: "-6u5Dx1-lkE",
    photoURL: "https://unsplash.com/photos/-6u5Dx1-lkE?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    userURL: "https://unsplash.com/@ansleycreative?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    username: "Matthew Ansley",
    width: 1080.0,
    height: 1620.0
  ),
  Photo(
    name: "hs_2Vjk9qOU",
    photoURL: "https://unsplash.com/photos/hs_2Vjk9qOU?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    userURL: "https://unsplash.com/@antonjau?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    username: "Antón Jáuregui",
    width: 1080.0,
    height: 720.0
  ),
  Photo(
    name: "xlrTQKjAz78",
    photoURL: "https://unsplash.com/photos/xlrTQKjAz78?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    userURL: "https://unsplash.com/@jtylernix?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    username: "Tyler Nix",
    width: 1080.0,
    height: 720.0
  ),
  Photo(
    name: "SrqCf0SBaS8",
    photoURL: "https://unsplash.com/photos/SrqCf0SBaS8?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    userURL: "https://unsplash.com/@creaslim?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    username: "Creaslim",
    width: 1080.0,
    height: 1350.0
  ),
  Photo(
    name: "Ez5wjPTCRLQ",
    photoURL: "https://unsplash.com/photos/Ez5wjPTCRLQ?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    userURL: "https://unsplash.com/@gmat07?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    username: "Gabriel Matula",
    width: 1080.0,
    height: 608.0
  ),
  Photo(
    name: "mGYxAWITqMg",
    photoURL: "https://unsplash.com/photos/mGYxAWITqMg?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    userURL: "https://unsplash.com/@jeisblack?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    username: "Jason Blackeye",
    width: 1080.0,
    height: 646.0
  ),
  Photo(
    name: "H3wVbNfdhtg",
    photoURL: "https://unsplash.com/photos/H3wVbNfdhtg?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    userURL: "https://unsplash.com/@sickhews?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    username: "Wes Hicks",
    width: 1080.0,
    height: 1350.0
  ),
  Photo(
    name: "83FN4F75NUw",
    photoURL: "https://unsplash.com/photos/83FN4F75NUw?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    userURL: "https://unsplash.com/@bravionics?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    username: "Brian Hawkins",
    width: 1080.0,
    height: 720.0
  ),
  Photo(
    name: "HW5013eyvlU",
    photoURL: "https://unsplash.com/photos/HW5013eyvlU?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    userURL: "https://unsplash.com/@derekowensheart?utm_source=unsample&utm_medium=referral&utm_campaign=api-credit",
    username: "Derek Owens",
    width: 1080.0,
    height: 720.0
  )
]

