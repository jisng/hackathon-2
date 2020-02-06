//
//  AppDelegate.swift
//  BongDeoGee
//
//  Created by 박지승 on 2020/02/02.
//  Copyright © 2020 Jisng. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // 기본적으로 해야 할 일
    // StartVC - UI
    // MainVC - UI
    // GameOverVC - UI
    
    // GameLevel - 1, 2, 3, 4, 5, 6, 7, 8, 9
    // 1, 2, 3 : 3*3 (08 -> 065 -> 05)
    // 4, 5, 6 : 4*4 (08 -> 065 -> 05)
    // 7, 8, 9 : 5*5 (08 -> 065 -> 05)
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .systemBackground
        if UserDefaults.standard.string(forKey: UserDefault.name) != nil {
            window?.rootViewController = MainViewController(name: UserDefaults.standard.string(forKey: UserDefault.name)!,
                                                            level: 0,
                                                            score: UserDefaults.standard.integer(forKey: UserDefault.score) )
        } else {
            window?.rootViewController = LaunchViewController()
        }
        window?.makeKeyAndVisible()
        
        return true
    }
}

// 어플 처음 입장 화면 : StartSettingViewController() - 한 번 가입하면 두 번 볼 일 없는 화면
// 게임 시작 전 메인 화면 : MainViewController()
// 게임 화면 : GameViewController()
// 게임 종료 화면 : GameOverViewContorller() - 게임 성공 시 SuccessGameView / 게임 실패 시 FailGameView
