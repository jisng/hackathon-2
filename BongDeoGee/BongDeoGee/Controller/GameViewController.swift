//
//  ViewController.swift
//  BongDeoGee
//
//  Created by 박지승 on 2020/02/02.
//  Copyright © 2020 Jisng. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
  
  var itemCount = 3
  
  var tempIndexPath: Int?
  
  var bbongsStatus = false
  
  var score: Int = 0 {
    willSet {
     currentScoreView.scoreText = newValue
    }
  }
  
  var gameTimer = Timer()
  var itemTimer = Timer()
  
  var counter: Int = 0 {
    willSet {
      currentScoreView.timerText = TimeToString(counter: newValue)
    }
  }
  var sec = 0
  var nano = 0
  
  private let currentScoreView = CurrentScoreView()
  private let controlView = ControlView()
  
  private let layout = UICollectionViewFlowLayout()
  lazy var collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionViewUI()
    autolayout()
    collectionView.allowsMultipleSelection = false
    controlAction()
  }
  
  private func controlAction() {
    controlView.startButton.addTarget(self, action: #selector(didControlAction(_:)), for: .touchUpInside)
    controlView.cancelButton.addTarget(self, action: #selector(didControlAction(_:)), for: .touchUpInside)
  }
  
  @objc func didControlAction(_ button: UIButton) {
    switch button {
    case controlView.startButton:
      startTimer()
    default:
      stopTimer()
      collectionView.visibleCells.forEach { $0.isSelected = false }
    }
  }
  
  private func stopTimer() {
    gameTimer.invalidate()
    itemTimer.invalidate()
    counter = 0
    sec = 0
    nano = 0
    score = 0
    currentScoreView.timerText = "준비"
  }
  
  private func startTimer() {
    gameTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timeAction), userInfo: nil, repeats: true)
    itemTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(itemAction), userInfo: nil, repeats: true)
  }
  
  @objc func timeAction() {
    counter += 1
  }
  
  private func TimeToString (counter: Int) -> String {
    sec = (counter / 100) % 60
    nano = counter % 100
    return String(format: "%02d", self.sec) + " : " + String(format: "%02d", self.nano)
  }
  
  @objc func itemAction() {
    randomPopUp()
  }
  
  private func makeItemCount() -> [Int] {
    var array: [Int] = []
    for i in 0...(itemCount*itemCount-1) {
      array.append(i)
    }
    return array
  }
  
  private func bbongsPopUp() {
    guard let intIndex = makeItemCount().randomElement() else { return }
    if intIndex == tempIndexPath {
      bbongsPopUp()
    } else {
      let indexPath = IndexPath(item: intIndex, section: 0)
      collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredVertically)
      bbongsStatus = true
    }
  }
  
  private func randomPopUp() {
    let indexPath = randomIndex()
    collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredVertically)
    bbongsStatus = false
  }
  
  private func randomIndex() -> IndexPath {
    guard let randomInt = makeItemCount().randomElement() else { return IndexPath(item: 0, section: 0)}
    if tempIndexPath == randomInt {
      return randomIndex()
    } else {
      tempIndexPath = randomInt
      return IndexPath(item: randomInt, section: 0)
    }
  }
  
  private func collectionViewUI() {
    let itemsInLine: CGFloat = CGFloat(itemCount)
    let spacing:CGFloat = 1
    let insets = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
    let cWidth = collectionView.bounds.width
    let contentSize = cWidth - insets.left - insets.right - (spacing * itemsInLine - 1)
    let itemSize = (contentSize / itemsInLine).rounded(.down)
    
    layout.minimumLineSpacing = spacing
    layout.minimumInteritemSpacing = spacing
    layout.sectionInset = insets
    layout.itemSize = CGSize(width: itemSize, height: itemSize)
    
    collectionView.register(CustomCollectionCell.self, forCellWithReuseIdentifier: CustomCollectionCell.identifier)
    collectionView.backgroundColor = .white
    collectionView.dataSource = self
  }
  
  private func autolayout() {
    let guide = view.safeAreaLayoutGuide
    
    view.addSubview(currentScoreView)
    currentScoreView.translatesAutoresizingMaskIntoConstraints = false
    currentScoreView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    currentScoreView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    currentScoreView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    currentScoreView.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: 0.2).isActive = true
    
    view.addSubview(controlView)
    controlView.translatesAutoresizingMaskIntoConstraints = false
    controlView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    controlView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    controlView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    controlView.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: 0.2).isActive = true
    
    view.addSubview(collectionView)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.topAnchor.constraint(equalTo: currentScoreView.bottomAnchor).isActive = true
    collectionView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    collectionView.bottomAnchor.constraint(equalTo: controlView.topAnchor).isActive = true
  }
}

extension GameViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return makeItemCount().count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionCell.identifier, for: indexPath) as? CustomCollectionCell else { return UICollectionViewCell() }
    cell.delegate = self
    return cell
  }
  
}

extension GameViewController: CustomCollectionCellDelegate {
  func cellChangeAction(isSelected: Bool, cell: CustomCollectionCell) {
    if isSelected {
      if bbongsStatus {
        cell.imageView.image = UIImage(named: "두더지")
        cell.contentView.backgroundColor = .red
      } else {
        cell.imageView.image = UIImage(named: "두더지")
      }
    } else {
      cell.imageView.image = UIImage(named: "두더지없음")
      cell.contentView.backgroundColor = .white
    }
  }
  
  func buttonAction(cell: CustomCollectionCell) {
    guard
      let tapIndexPath = collectionView.indexPath(for: cell),
      let selectIndexPath = collectionView.indexPathsForSelectedItems?.first
      else { return }
    
    if tapIndexPath == selectIndexPath {
      score += 100
    } else {
      score -= 100
    }
  }
}
