//
//  OneWeekView.swift
//  ShiggyKit
//
//  Created by HanaIsMe on 06/26/2019.
//  Copyright (c) 2019 HanaIsMe. All rights reserved.
//

import UIKit
import ShiggyKit

class OneWeekView: UIView {
    
    @IBOutlet var oneDayViewCollection: [OneDayView]!
    
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
        let nib = UINib(nibName: "OneWeekView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func setUI() {
        for theView in oneDayViewCollection {
            theView.delegate = nil
            theView.setUI(tag: theView.tag)
        }
    }
    
    func setUI(oneDay: Date, indexPath: IndexPath) {
        for theView in oneDayViewCollection {
            theView.delegate = self
            guard let thisMonthFirstDate = oneDay.shiggy.thisMonthFirstDate else { return }
            let thisWeekDate = thisMonthFirstDate.shiggy.weeksAfter(numOfWeeks: indexPath.row)
            guard let thisWeekFirstDate = thisWeekDate.shiggy.thisWeekFirstDate else { return }
            let theDate = thisWeekFirstDate.shiggy.getDay(daysFromToday: theView.tag - 1)
            theView.setUI(isThisMonth: thisMonthFirstDate.shiggy.toMonth == theDate.shiggy.toMonth, theDate: theDate)
        }
    }
    
}

extension OneWeekView: OneDayViewDelegate {
    
    func selected(theDayView: OneDayView) {
        self.delegate?.selected(theDayView: theDayView)
    }
    
}
