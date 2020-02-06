//
//  GameOverViewController.swift
//  BongDeoGee
//
//  Created by 박지승 on 2020/02/03.
//  Copyright © 2020 Jisng. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

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
//        uploadToDatabase()
    }
    
    init(level: Int, score: Int) {
        userLevel = level
        userScore = score
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTabButton(_ button: UIButton) {
        if userScore > UserDefaults.standard.integer(forKey: UserDefault.score) {
            UserDefaults.standard.set(userScore, forKey: UserDefault.score)
        } else {
            
        }
        
        if button == endButton {
            dismiss(animated: true, completion: nil)
        } else {
            if button.backgroundColor == .orange {
                
            } else {
                
            }
        }
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
        endButton.addTarget(self, action:#selector(didTabButton(_:)), for: .touchUpInside)
        
        startButton.setTitle("재도전/다음 단계", for: .normal)
        startButton.backgroundColor = .orange
        startButton.addTarget(self, action: #selector(didTabButton(_:)), for: .touchUpInside)
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
    
    //    private func uploadToDatabase() {
    //
    //        let values = ["userName": staticName ?? "noname",
    //                                 "userScore": "\(userScore)" ?? "0",
    //                                 "userLevel": "\(userLevel)" ?? "0",
    //                       ] as [String : Any]
    //
    //
    //        Database.database().reference().child("\(staticName)").setValue(values) { (error, ref) in
    //            if error != nil {
    //                print("Success Upload To Database")
    //                print(ref)
    //            }
    //        }
    //
    //        allLoadFromDatabase()
    //}
    //
    //    private func allLoadFromDatabase() {
    //
    //        var upperNameArray: Array<String> = []
    //
    //        Database.database().reference().observeSingleEvent(of: .value) { (snapshop) in
    //            upperNameArray = snapshop.value as? [String] ?? ["wrongName"]
    //
    //        }
    //
    //        for name in upperNameArray {
    //            Database.database().reference().child(name).observeSingleEvent(of: .value) { (snapshop) in
    //            let data = snapshop.value as? [String:Any] ?? ["fail":"fail"]
    //            guard let name = data["userName"] as? String else { return }
    //            guard let score = data["userScore"] as? String else {return }
    //            guard let level = data["userLevel"] as? String else { return }
    //            }
    //
    //        }
    //
    //    }
}
