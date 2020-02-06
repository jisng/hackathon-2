//
//  GameOverViewController.swift
//  BongDeoGee
//
//  Created by 박지승 on 2020/02/03.
//  Copyright © 2020 Jisng. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {
    
    private var userLevel: Int
    private var userScore: Int
    
    private let backgroundView = UIView()
    private let statusLabel = UILabel()
    private let levelLabel = UILabel()
    private let scoreLabel = UILabel()
    private let endButton = UIButton()
    private let startButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    init(level: Int, score: Int) {
        userLevel = level
        userScore = score
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        backgroundView.backgroundColor = #colorLiteral(red: 0.7523879409, green: 0.5880567431, blue: 0.4615229368, alpha: 1)
        
        statusLabel.text = "SUCCESS / FAIL"
        statusLabel.font = .systemFont(ofSize: 50)
        
        levelLabel.text = String(userLevel)
        levelLabel.font = .systemFont(ofSize: 30)
        
        scoreLabel.text = String(userScore)
        scoreLabel.font = .systemFont(ofSize: 40)
        
        endButton.setTitle("종료", for: .normal)
        endButton.backgroundColor = .brown
        
        startButton.setTitle("재도전/다음 단계", for: .normal)
        startButton.backgroundColor = .orange
    }
    
    private func setLayout() {
        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        backgroundView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6).isActive = true
        backgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        [statusLabel, levelLabel, scoreLabel, endButton, startButton].forEach({
            backgroundView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        })
        
        statusLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: Padding.padding).isActive = true
        statusLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
        
        levelLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: Padding.padding).isActive = true
        levelLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
        
        scoreLabel.topAnchor.constraint(equalTo: levelLabel.bottomAnchor, constant: Padding.padding).isActive = true
        scoreLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
        
        endButton.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -Padding.padding).isActive = true
        endButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: Padding.buttonPadding).isActive = true
        endButton.trailingAnchor.constraint(equalTo: backgroundView.centerXAnchor, constant: -Padding.buttonPadding).isActive = true
        
        startButton.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -Padding.padding).isActive = true
        startButton.leadingAnchor.constraint(equalTo: backgroundView.centerXAnchor, constant: Padding.buttonPadding).isActive = true
        startButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -Padding.buttonPadding).isActive = true
    }
}
