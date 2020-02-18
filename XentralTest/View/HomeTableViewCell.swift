//
//  HomeTableViewCell.swift
//  XentralTest
//
//  Created by Ayus Salleh on 17/02/2020.
//  Copyright © 2020 Ayus_Salleh. All rights reserved.
//

import UIKit

protocol HomeTableViewCellDelegate: class {
    func btnFirstBookPressed(indexPath: IndexPath)
    func btnSecondBookPressed(indexPath: IndexPath)
}

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewFirst: BookCoverImageView!
    @IBOutlet weak var imageViewSecond: BookCoverImageView!
    
    weak var delegate: HomeTableViewCellDelegate?
    var indexPath: IndexPath!
    
    func setValue(indexPath: IndexPath, firstCover: UIImage?, lastCover: UIImage?) {
        self.indexPath = indexPath
        imageViewFirst.image = firstCover
        imageViewSecond.image = lastCover
    }

    @IBAction func btnFirstBookPressed(_ sender: UIButton) {
        self.delegate?.btnFirstBookPressed(indexPath: indexPath)
    }
    
    @IBAction func btnSecondBookPressed(_ sender: UIButton) {
        self.delegate?.btnSecondBookPressed(indexPath: indexPath)
    }
    
}
