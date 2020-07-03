//
//  RoundedView.swift
//  NewsApp
//
//  Created by Monya on 7/2/20.
//  Copyright © 2020 Zhegalik.Inc. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = 20
        layer.masksToBounds = true
    }
    
}
