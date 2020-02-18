//
//  BookCoverImageView.swift
//  XentralTest
//
//  Created by Ayus Salleh on 18/02/2020.
//  Copyright © 2020 Ayus_Salleh. All rights reserved.
//

import UIKit

class BookCoverImageView: UIImageView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.contentMode = .scaleToFill
    }

}
