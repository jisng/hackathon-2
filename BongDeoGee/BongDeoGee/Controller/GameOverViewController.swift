//
//  GameOverViewController.swift
//  BongDeoGee
//
//  Created by 박지승 on 2020/02/03.
//  Copyright © 2020 Jisng. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {

  
  private let failView = FailGameView()
  private let successView = SuccessGameView()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      gameStatusView(gameView: failView)
    }
  
  func gameStatusView(gameView: UIView) {
    view.addSubview(gameView)
    gameView.translatesAutoresizingMaskIntoConstraints = false
    gameView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    gameView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    gameView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    gameView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    gameView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    gameView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
  }
}
