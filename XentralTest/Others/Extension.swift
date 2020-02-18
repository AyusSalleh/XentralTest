//
//  Extension.swift
//  XentralTest
//
//  Created by Ayus Salleh on 17/02/2020.
//  Copyright © 2020 Ayus_Salleh. All rights reserved.
//

import UIKit

// Copy from https://www.hackingwithswift.com/example-code/language/how-to-split-an-array-into-chunks
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

// Copy from https://stackoverflow.com/questions/27049937/how-to-set-a-background-image-in-xcode-using-swift/36309946
extension UIView {
    func addBackgroundImage(imageNamed: String) {
        let backgroundImage = UIImageView(frame: self.bounds)
        backgroundImage.image = UIImage(named: imageNamed)
        backgroundImage.contentMode = .scaleAspectFill
        self.insertSubview(backgroundImage, at: 0)

    }
}
