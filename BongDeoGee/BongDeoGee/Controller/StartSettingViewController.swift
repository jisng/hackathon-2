//
//  FirstSettingViewController.swift
//  BongDeoGee
//
//  Created by 박지승 on 2020/02/04.
//  Copyright © 2020 Jisng. All rights reserved.
//

import UIKit

class StartSettingViewController: UIViewController {
  // - InfoSettingView ("게임을 시작합니다" / [이름 입력창] / [버튼])
  
  private var name: String?
  
  private let inputLabel = UILabel()
  private let inputTextField = UITextField()
  private let guideLine = UILabel()
  private let okButton = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
    setLayout()
  }
  
  @objc func didTabOkButton(_ button: UIButton) {
    guard let txt = inputTextField.text else { return }
    name = txt
    
    if name == "" {
      alertAction()
    } else {
      let mainVC = MainViewController(name: name ?? "뭐야 이 옵셔널은", level: 1, score: 0)
      mainVC.modalPresentationStyle = .fullScreen
      present(mainVC, animated: true)
    }
  }
  
  private func alertAction() {
    let alert = UIAlertController(title: "이름을 입력하세요", message: "", preferredStyle: .alert)
    let ok = UIAlertAction(title: "확인", style: .default) { _ in
      self.inputTextField.becomeFirstResponder()
    }
    alert.addAction(ok)
    present(alert, animated: true)
  }
  
  private func setUI() {
    inputLabel.text = "게임을 시작합니다"
    inputLabel.font = .systemFont(ofSize: 30)
    inputLabel.textAlignment = .center
    
    inputTextField.placeholder = "이름을 입력하세요"
    inputTextField.font = .systemFont(ofSize: 30)
    inputTextField.borderStyle = .none
    inputTextField.delegate = self
    
    guideLine.backgroundColor = .lightGray
    
    okButton.setTitle("입장하기", for: .normal)
    okButton.titleLabel?.font = .systemFont(ofSize: 30)
    okButton.backgroundColor = .brown
    okButton.addTarget(self, action: #selector(didTabOkButton(_:)), for: .touchUpInside)
  }
  
  private func setLayout() {
    let guide = view.safeAreaLayoutGuide
    
    [inputLabel, inputTextField, guideLine, okButton].forEach({
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    })
    
    inputLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: Padding.padding).isActive = true
    inputLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
    
    inputTextField.topAnchor.constraint(equalTo: inputLabel.bottomAnchor, constant: Padding.padding).isActive = true
    inputTextField.leadingAnchor.constraint(equalTo: inputLabel.leadingAnchor, constant: Padding.padding).isActive = true
    inputTextField.trailingAnchor.constraint(equalTo: inputLabel.trailingAnchor, constant: -Padding.padding).isActive = true
    
    guideLine.topAnchor.constraint(equalTo: inputTextField.bottomAnchor, constant: 10).isActive = true
    guideLine.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
    guideLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
    guideLine.widthAnchor.constraint(equalTo: inputTextField.widthAnchor, multiplier: 1.2).isActive = true
    
    
    okButton.topAnchor.constraint(equalTo: guideLine.bottomAnchor, constant: Padding.padding).isActive = true
    okButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: Padding.buttonPadding).isActive = true
    okButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -Padding.buttonPadding).isActive = true
    
  }
  
}

extension StartSettingViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField.text == "" {
      return false
    } else {
      textField.resignFirstResponder()
      return true
    }
  }
}
