//
//  OneDayView.swift
//  ShiggyKit
//
//  Created by HanaIsMe on 06/26/2019.
//  Copyright (c) 2019 HanaIsMe. All rights reserved.
//

import UIKit
import ShiggyKit

protocol OneDayViewDelegate {
    func selected(theDayView: OneDayView)
}

class OneDayView: UIView {
    
    @IBOutlet weak var theDayLabel: UILabel!
    @IBOutlet weak var theDayButton: UIButton!
    
    var theDate: Date?
    private var isThisMonth = false
    var delegate: OneDayViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "OneDayView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        theDayButton.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
    }
    
    func setUI(isThisMonth: Bool, theDate: Date) {
        self.theDate = theDate
        self.isThisMonth = isThisMonth
        self.backgroundColor = UIColor.white
        self.theDayLabel.text = theDate.shiggy.toDay
        self.theDayLabel.textColor = isThisMonth ? UIColor.black : UIColor.lightGray
    }
    
    func setUI(tag: Int) {
        self.theDate = nil
        self.theDayButton.isEnabled = false
        self.theDayLabel.text = tag.toWeekdayString
        self.theDayLabel.backgroundColor = UIColor.darkGray
        self.theDayLabel.textColor = UIColor.white
    }
    
    @objc func buttonTapped() {
        self.theDayLabel.textColor = UIColor.red
        self.delegate?.selected(theDayView: self)
    }
    
    func goBackToOriginalFont() {
        self.theDayLabel.textColor = isThisMonth ? UIColor.black : UIColor.lightGray
    }
    
}

extension Int {
    
    var toWeekdayString: String? {
        guard let weekday = Weekday.init(rawValue: self) else { return nil }
        switch weekday {
        case .sunday:    return "Sun"
        case .monday:    return "Mon"
        case .tuesday:   return "Tue"
        case .wednesday: return "Wed"
        case .thursday:  return "Thu"
        case .friday:    return "Fri"
        case .saturday:  return "Sat"
        }
    }
    
}
