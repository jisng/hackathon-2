//
//  AppDelegate.swift
//  BongDeoGee
//
//  Created by 박지승 on 2020/02/02.
//  Copyright © 2020 Jisng. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.backgroundColor = .systemBackground
    window?.rootViewController = StartSettingViewController()
    window?.makeKeyAndVisible()
    
    return true
  }
}

// 어플 처음 입장 화면 : StartSettingViewController() - 한 번 가입하면 두 번 볼 일 없는 화면
// 게임 시작 전 메인 화면 : MainViewController()
// 게임 화면 : GameViewController()
// 게임 종료 화면 : GameOverViewContorller() - 게임 성공 시 SuccessGameView / 게임 실패 시 FailGameView
//

