//
//  ViewController.swift
//  ShiggyKit
//
//  Created by HanaIsMe on 06/26/2019.
//  Copyright (c) 2019 HanaIsMe. All rights reserved.
//

import UIKit
import ShiggyKit

class ViewController: UIViewController {
    
    @IBOutlet weak var previousMonthButton: UIBarButtonItem!
    @IBOutlet weak var nextMonthButton: UIBarButtonItem!
    
    @IBOutlet weak var headerView: OneWeekView!
    @IBOutlet weak var calendarView: UITableView!
    
    private var oneDate: Date? {
        didSet {
            if let date = oneDate {
                let year = date.shiggy.toYear
                let month = date.shiggy.toMonth
                self.navigationController?.navigationBar.topItem?.title = "\(year)-\(month)"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.setUI()
        previousMonthButton.accessibilityIdentifier = "PREVIOUS_MONTH_BUTTON"
        nextMonthButton.accessibilityIdentifier = "NEXT_MONTH_BUTTON"
        calendarView.dataSource = self
        calendarView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.oneDate = Date()
    }
    
    @IBAction func previousMonthButtonTapped(_ sender: Any) {
        guard let date = self.oneDate else { return }
        self.oneDate = date.shiggy.oneMonthBefore
        self.calendarView.reloadData()
    }
    
    @IBAction func nextMonthButtonTapped(_ sender: Any) {
        guard let date = self.oneDate else { return }
        self.oneDate = date.shiggy.oneMonthAfter
        self.calendarView.reloadData()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let theDate = self.oneDate else { return 0 }
        return theDate.shiggy.numberOfWeeks ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "oneWeekTableViewCell") as! OneWeekTableViewCell
        cell.oneWeekView.delegate = self
        cell.oneWeekView.setUI(oneDay: self.oneDate ?? Date(), indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
}

extension ViewController: OneDayViewDelegate {
    
    func selected(theDayView: OneDayView) {
        guard let theDate = theDayView.theDate,
            let theDateToString = theDate.shiggy.toStringIgnoreUTC else { return }
        self.shiggy.showAlertWithOneButton(title: "Selected day is...!",
                                           message: theDateToString,
                                           firstButtonTitle: "OK",
                                           firstButtonAction: { theDayView.goBackToOriginalFont() },
                                           firstButtonStyle: .destructive)
    }
    
}

class OneWeekTableViewCell: UITableViewCell {
    
    @IBOutlet weak var oneWeekView: OneWeekView!

}
