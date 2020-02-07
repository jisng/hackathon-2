//
//  MainViewController.swift
//  BongDeoGee
//
//  Created by 박지승 on 2020/02/04.
//  Copyright © 2020 Jisng. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

var staticName = ""

class MainViewController: UIViewController {
    
    private var score: Int {
        didSet {
            scoreLabel.text = "최고 점수! \(self.score) 점"
        }
    }
    
    var level: GameSet
    
    private let nameLabel = UILabel()
    private let levelView = LevelSelectView()
    private let scoreLabel = UILabel()
    private let startButton = UIButton()
    
    init(name: String, level: GameSet, score: Int) {
        nameLabel.text = name
        self.score = score
        self.level = level
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        switch levelIdx {
        case 0:
            self.score = UserDefaults.standard.integer(forKey: UserDefault.score1)
        case 1:
            self.score = UserDefaults.standard.integer(forKey: UserDefault.score2)
        case 2:
            self.score = UserDefaults.standard.integer(forKey: UserDefault.score3)
        default:
            break
        }
        UIView.animate(
            withDuration: 0.2,
            delay: 0,
            animations: {
                self.startButton.transform = CGAffineTransform(rotationAngle: .pi * 4)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.9623679519, blue: 0.8724053502, alpha: 1)
        
        //        Auth.auth().signIn(withEmail: "test@naver.com", password: "123456") { (result, err) in
        //            if err == nil {
        //                print("로그인 성공")
        //            }
        //        }
        setUI()
        setLayout()
    }
    
    @objc func didTabStartButton(_ button: UIButton) {
        
        switch levelView.levelIndex {
        case 0:
//            gameVC.gameLevel = GameSet.level1.interval
            level = GameSet.level1
        case 1:
//            gameVC.gameLevel = GameSet.level2.interval
            level = GameSet.level2
        case 2:
//            gameVC.gameLevel = GameSet.level3.interval
            level = GameSet.level3
        default:
            break
        }
        UIView.animate(
            withDuration: 0.2,
            delay: 0,
            animations: {
                self.startButton.transform = CGAffineTransform(rotationAngle: .pi / 4)
                
        })
        
        let tutorialView = TutorialViewController(level: self.level)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        tutorialView.modalPresentationStyle = .fullScreen
        tutorialView.modalTransitionStyle = .crossDissolve
            print("------------------------", self.level)
        self.present(tutorialView, animated: true)
            
        }
    }
    
    private func setUI() {
        nameLabel.font = .systemFont(ofSize: 40)
        nameLabel.textColor = .darkGray
        
        switch levelIdx {
        case 0:
            if UserDefaults.standard.integer(forKey: UserDefault.score1) == 0 {
                scoreLabel.text = "게임을 시작하세요!"
            } else {
                score = UserDefaults.standard.integer(forKey: UserDefault.score1)
            }
        case 1:
            if UserDefaults.standard.integer(forKey: UserDefault.score2) == 0 {
                scoreLabel.text = "게임을 시작하세요!"
            } else {
                score = UserDefaults.standard.integer(forKey: UserDefault.score2)
            }
        case 2:
            if UserDefaults.standard.integer(forKey: UserDefault.score3) == 0 {
                scoreLabel.text = "게임을 시작하세요!"
            } else {
                score = UserDefaults.standard.integer(forKey: UserDefault.score3)
            }
        default:
            break
        }
        
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
