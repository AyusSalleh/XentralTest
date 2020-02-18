//
//  BookDetailViewModel.swift
//  XentralTest
//
//  Created by Ayus Salleh on 18/02/2020.
//  Copyright © 2020 Ayus_Salleh. All rights reserved.
//

import UIKit

class BookDetailViewModel: BaseViewModel {
    
    /// This function used to animate when changing color
    /// - Parameter completion: Can be used for completion of animation
    func animateViewBGColor(completion: @escaping () -> ()) {
        UIView.animate(withDuration: 0.25) {
            completion()
        }
    }
    
    /// This function used to animate button when being tapped
    /// - Parameter button: Pass button
    /// - Parameter completion: Can used to handle after button finish animate
    func tapButtonWithAnimation(button: UIButton, completion: @escaping () -> ()) {
        UIView.animate(withDuration: 0.1, animations: {
            button.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }, completion: { _ in
            UIView.animate(withDuration: 0.1) {
                button.transform = CGAffineTransform.identity
                completion()
            }
        })
    }    
}
