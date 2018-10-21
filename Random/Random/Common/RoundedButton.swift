//
//  RoundedButton.swift
//  Random
//
//  Created by Víctor Vicente on 22/10/2018.
//  Copyright © 2018 AKA7. All rights reserved.
//

import Foundation
import UIKit

class RoundedButton: UIButton {
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setTitleColor(.white, for: .normal)
        setTitleColor(UIColor.midnightBlue(), for: .highlighted)
        applyNormalStyle()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
        layer.borderWidth = 1
    }
    
    override var isHighlighted: Bool {
        didSet {
            isHighlighted ? applyHighlightedStyle() : applyNormalStyle()
        }
    }
    
    override var isSelected: Bool {
        didSet {
            isSelected ? applyHighlightedStyle() : applyNormalStyle()
        }
    }
    
    private func applyNormalStyle() {
        backgroundColor = UIColor.midnightBlue()
        layer.borderColor = UIColor.white.cgColor
    }
    
    private func applyHighlightedStyle() {
        backgroundColor = .white
        layer.borderColor = UIColor.midnightBlue().cgColor
    }
    
}
