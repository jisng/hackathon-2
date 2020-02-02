//
//  CurrentScoreView.swift
//  BongDeoGee
//
//  Created by 박지승 on 2020/02/02.
//  Copyright © 2020 Jisng. All rights reserved.
//

import UIKit

class CurrentScoreView: UIView {

  var timerText: String = "준비" {
    willSet {
      timerLabel.text = "\(newValue)"
    }
  }
  
  var scoreText: Int = 0 {
    willSet {
      scoreLabel.text = "\(newValue)"
    }
  }
  
  private let timerLabel = UILabel()
  private let scoreLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    baseUI()
  }
  
  private func baseUI() {
    timerLabel.text = timerText
    timerLabel.backgroundColor = .brown
    timerLabel.font = .systemFont(ofSize: 15, weight: .medium)
    timerLabel.textAlignment = .center
    
    scoreLabel.text = "\(scoreText)"
    scoreLabel.backgroundColor = .green
    scoreLabel.font = .systemFont(ofSize: 15, weight: .bold)
    scoreLabel.textAlignment = .center
    
    self.addSubview(timerLabel)
    self.addSubview(scoreLabel)
    
    timerLabel.translatesAutoresizingMaskIntoConstraints = false
    scoreLabel.translatesAutoresizingMaskIntoConstraints = false
    
    timerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
    timerLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    timerLabel.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -10).isActive = true
    timerLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3).isActive = true
    
    scoreLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
    scoreLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    scoreLabel.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 10).isActive = true
    scoreLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3).isActive = true
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
