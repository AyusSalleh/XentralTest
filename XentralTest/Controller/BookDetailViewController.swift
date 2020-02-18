//
//  BookDetailViewController.swift
//  XentralTest
//
//  Created by Ayus Salleh on 18/02/2020.
//  Copyright © 2020 Ayus_Salleh. All rights reserved.
//

import UIKit

class BookDetailViewController: BaseViewController {

    @IBOutlet weak var viewMainContainer: UIView!
    @IBOutlet weak var imageViewBookCover: BookCoverImageView!
    @IBOutlet weak var lblBookTitle: UILabel!
    @IBOutlet weak var btnRead: RoundedCornerButton!
    @IBOutlet weak var btnShare: RoundedCornerButton!
    @IBOutlet weak var btnDelete: RoundedCornerButton!

    private var viewModel = BookDetailViewModel()
    var bookDetail: Book!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.animateViewBGColor { [weak self] in
            self?.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        viewModel.animateViewBGColor { [weak self] in
            self?.view.backgroundColor = .clear
        }
    }
    
    @IBAction func btnReadPressed(_ sender: RoundedCornerButton) {
        viewModel.tapButtonWithAnimation(button: sender) {
            print("Read tap!")
        }
    }
    
    @IBAction func btnSharePressed(_ sender: RoundedCornerButton) {
        viewModel.tapButtonWithAnimation(button: sender) { 
            print("Share tap!")
        }
    }
    
    @IBAction func btnDeletePressed(_ sender: RoundedCornerButton) {
        viewModel.tapButtonWithAnimation(button: sender) {
            print("Delete tap!")
        }
    }
    
    @IBAction func btnClosePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func configureUI() {
        self.view.backgroundColor = .clear
        self.viewMainContainer.layer.cornerRadius = 5

        imageViewBookCover.image = UIImage(named: bookDetail.cover)
        lblBookTitle.text = bookDetail.title
    }

}
