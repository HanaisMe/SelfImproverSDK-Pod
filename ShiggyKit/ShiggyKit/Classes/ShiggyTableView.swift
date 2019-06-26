//
//  ShiggyTableView.swift
//  ShiggyKit
//
//  Created by Lee, Jeongsik on 2019/06/11.
//  Copyright © 2019 Lee, Jeongsik. All rights reserved.
//

import Foundation
import UIKit

public struct ShiggyTableView {
    
    private let tableView: UITableView
    
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    /**
     Deselect all the row(s) selected in the table view.
     - Returns: If any row was selected before action, it returns true. Otherwise, returns false.
     */
    public var deselectAllRows: Bool {
        if let indexPathsForSelectedRows = self.tableView.indexPathsForSelectedRows {
            for indexPath in indexPathsForSelectedRows {
                self.tableView.deselectRow(at: indexPath, animated: true)
            }
            return true
        }
        return false
    }
    
}
