//
//  Data.swift
//  BongDeoGee
//
//  Created by 박지승 on 2020/02/02.
//  Copyright © 2020 Jisng. All rights reserved.
//

import Foundation

enum selectStatus {
  case fail, success, bbongs
}

struct Record {
  let name: String
  var level: Int
  var scroe: Int
}
