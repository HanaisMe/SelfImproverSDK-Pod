//
//  DependencyContainer.swift
//  ShiggyKit_Example
//
//  Created by Lee, Jeongsik on 2019/06/28.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

protocol Dependency {
    func resolveDate() -> String
}
