//
//  ViewController.swift
//  XentralTest
//
//  Created by Ayus Salleh on 17/02/2020.
//  Copyright © 2020 Ayus_Salleh. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureTableView()
        configureData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBookDetailVC", let controller = segue.destination as? BookDetailViewController, let bookDetail = sender as? Book {
            controller.bookDetail = bookDetail
        }
    }
    
    private func configureUI() {
        configureViewModelBinding(viewModel)
        title = "Xentral Test"
        view.addBackgroundImage(imageNamed: "background")
    }
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.separatorColor = .clear
        tableView.backgroundColor = .clear
    }
    
    private func configureData() {
        viewModel.getBooks { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.books.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.getRowHeight(tableView: tableView)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        
        let (firstCover, lastCover) = viewModel.getCellDetail(indexPath: indexPath)
        cell.setValue(indexPath: indexPath, firstCover: firstCover, lastCover: lastCover)
        cell.delegate = self
        
        return cell
    }
}

extension HomeViewController: HomeTableViewCellDelegate {
    func btnFirstBookPressed(indexPath: IndexPath) {
        let book = viewModel.getBook(type: .first, indexPath: indexPath)
        self.performSegue(withIdentifier: "showBookDetailVC", sender: book)
    }
    
    func btnSecondBookPressed(indexPath: IndexPath) {
        guard let book = viewModel.getBook(type: .last, indexPath: indexPath) else { return }
        self.performSegue(withIdentifier: "showBookDetailVC", sender: book)
    }
}

