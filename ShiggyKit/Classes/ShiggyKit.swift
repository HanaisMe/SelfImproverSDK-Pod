//
//  ShiggyKit.swift
//  ShiggyKit
//
//  Created by Lee, Jeongsik on 2019/06/11.
//  Copyright © 2019 Lee, Jeongsik. All rights reserved.
//

import Foundation

protocol ShiggyKitInstance {
    associatedtype T
    var shiggy: T { get }
}

extension Date: ShiggyKitInstance {
    typealias T = ShiggyDate
    public var shiggy: ShiggyDate {
        return ShiggyDate.init(date: self)
    }
}

extension String: ShiggyKitInstance {
    typealias T = ShiggyString
    public var shiggy: ShiggyString {
        return ShiggyString.init(string: self)
    }
}

extension UITableView: ShiggyKitInstance {
    typealias T = ShiggyTableView
    public var shiggy: ShiggyTableView {
        return ShiggyTableView.init(tableView: self)
    }
}

extension UIViewController: ShiggyKitInstance {
    typealias T = ShiggyViewController
    public var shiggy: ShiggyViewController {
        return ShiggyViewController.init(vc: self)
    }
}
