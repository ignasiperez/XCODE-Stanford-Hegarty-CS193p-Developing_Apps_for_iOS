//
//  Array+Only.swift
//  Memorize
//
//  Created by ignasiperez.com on 05/06/2020.
//  Copyright © 2020 Ignasi Perez-Valls. All rights reserved.
//

import Foundation

extension Array {
  var only: Element? {
    count == 1 ? first : nil
  }
}
