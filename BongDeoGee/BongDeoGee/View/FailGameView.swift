//
//  FailGameView.swift
//  BongDeoGee
//
//  Created by 박지승 on 2020/02/03.
//  Copyright © 2020 Jisng. All rights reserved.
//

import UIKit

class FailGameView: UIView {
  
  // - FailGameView ("실패" / 현재 레벨 / 획득 점수 / [버튼] 종료, 재도전)
  private let backgroundView = UIView()
  private let failLabel = UILabel()
  private let levelLabel = UILabel()
  private let scoreLabel = UILabel()
  private let endButton = UIButton()
  private let againButton = UIButton()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
//    self.backgroundColor?.withAlphaComponent(0.4)
    self.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    setUI()
    setLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setUI() {
    backgroundView.backgroundColor = #colorLiteral(red: 0.7523879409, green: 0.5880567431, blue: 0.4615229368, alpha: 1)
    
    failLabel.text = "FAIL"
    failLabel.font = .systemFont(ofSize: 50)
    
    levelLabel.text = "DATA"
    levelLabel.font = .systemFont(ofSize: 30)
    
    scoreLabel.text = "DATA"
    scoreLabel.font = .systemFont(ofSize: 40)
    
    endButton.setTitle("종료", for: .normal)
    endButton.backgroundColor = .brown

    againButton.setTitle("재도전", for: .normal)
    againButton.backgroundColor = .orange
  }
  
  private func setLayout() {
    self.addSubview(backgroundView)
    backgroundView.translatesAutoresizingMaskIntoConstraints = false
    backgroundView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
    backgroundView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6).isActive = true
    backgroundView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    backgroundView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    
    [failLabel, levelLabel, scoreLabel, endButton, againButton].forEach({ backgroundView.addSubview($0) })
    [failLabel, levelLabel, scoreLabel, endButton, againButton].forEach({ $0.translatesAutoresizingMaskIntoConstraints = false })
    
    failLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: Padding.padding).isActive = true
    failLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
    
    levelLabel.topAnchor.constraint(equalTo: failLabel.bottomAnchor, constant: Padding.padding).isActive = true
    levelLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
    
    scoreLabel.topAnchor.constraint(equalTo: levelLabel.bottomAnchor, constant: Padding.padding).isActive = true
    scoreLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
    
    endButton.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -Padding.padding).isActive = true
    endButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: Padding.buttonPadding).isActive = true
    endButton.trailingAnchor.constraint(equalTo: backgroundView.centerXAnchor, constant: -Padding.buttonPadding).isActive = true
    
    againButton.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -Padding.padding).isActive = true
    againButton.leadingAnchor.constraint(equalTo: backgroundView.centerXAnchor, constant: Padding.buttonPadding).isActive = true
    againButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -Padding.buttonPadding).isActive = true
    
  }
  
}
