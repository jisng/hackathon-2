//
//  MainViewController.swift
//  BongDeoGee
//
//  Created by 박지승 on 2020/02/04.
//  Copyright © 2020 Jisng. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private var score: Int {
        didSet {
            scoreLabel.text = "최고 점수 : \(self.score)"
        }
    }
    
    private let nameLabel = UILabel()
    private let levelView = LevelSelectView()
    private let scoreLabel = UILabel()
    private let startButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUI()
        setLayout()
    }
    
    init(name: String, level: Int, score: Int) {
        nameLabel.text = name
        //    self.level = level
        self.score = score
        super.init(nibName: nil, bundle: nil) // xib, storyboard 들어올 경우 받는 곳
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTabStartButton(_ button: UIButton) {
        let gameVC = GameViewController()
        gameVC.setTime = GameSet.level1.interval
        gameVC.modalPresentationStyle = .fullScreen
        gameVC.modalTransitionStyle = .crossDissolve
        present(gameVC, animated: true)
    }
    
    private func setUI() {
        nameLabel.font = .systemFont(ofSize: 40)
        nameLabel.textColor = .darkGray
        
        scoreLabel.text = "게임을 시작하세요!"
        scoreLabel.font = .systemFont(ofSize: 30)
        
        startButton.setImage(UIImage(named: "게임시작"), for: .normal)
        startButton.imageView?.contentMode = .scaleAspectFit
        startButton.backgroundColor = .clear
        startButton.addTarget(self, action: #selector(didTabStartButton(_:)), for: .touchUpInside)
        
    }
    private func setLayout() {
        
        let guide = view.safeAreaLayoutGuide
        
        [nameLabel, levelView, scoreLabel, startButton].forEach({
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        })
        
        nameLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: Padding.padding).isActive = true
        
        levelView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: Padding.padding).isActive = true
        levelView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -Padding.padding).isActive = true
        levelView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Padding.padding).isActive = true
        levelView.bottomAnchor.constraint(equalTo: scoreLabel.topAnchor, constant: -Padding.padding).isActive = true
        
        scoreLabel.topAnchor.constraint(equalTo: levelView.bottomAnchor, constant: Padding.padding).isActive = true
        
        startButton.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: Padding.padding).isActive = true
        startButton.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        startButton.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: 0.3).isActive = true
        startButton.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 0.65).isActive = true
    }
}
