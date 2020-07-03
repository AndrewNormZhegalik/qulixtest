//
//  CollectionViewCell.swift
//  NewsApp
//
//  Created by Monya on 7/2/20.
//  Copyright © 2020 Zhegalik.Inc. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var imgView: RoundedImageView!
    
    @IBOutlet weak var textView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .black
        clipsToBounds = true
        
        imgView.image = UIImage(named: "news")
    }
}
