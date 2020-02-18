//
//  HomeViewModel.swift
//  XentralTest
//
//  Created by Ayus Salleh on 17/02/2020.
//  Copyright © 2020 Ayus_Salleh. All rights reserved.
//

import UIKit

class HomeViewModel: BaseViewModel {

    enum ColumnType {
        case first
        case last
    }
    
    private let helper = Helper()
    
    var books: [[Book]] = []
    
    /// This function used to get contacts from local JSON file
    /// - Parameter completion: Can be used to refresh UITableView/UICollectionView
    func getBooks(completion: @escaping ()->()) {
        helper.getBookData { [weak self] (books, error) in
            if let error = error {
                self?.alertMessage = error.rawValue
            } else {
                self?.books = books.chunked(into: 2)
                completion()
            }
        }
    }
    
    /// This function used to get cell row height of the table
    /// - Parameter tableView: Pass tableView to calculate the frame
    func getRowHeight(tableView: UITableView) -> CGFloat {
        return tableView.frame.height / 2
    }
    
    /// This function used to get cell UI detail/configuration
    /// - Parameter indexPath: Pass indexPath
    func getCellDetail(indexPath: IndexPath) -> (UIImage?, UIImage?) {
        let booksInIndex = books[indexPath.row]
        guard let firstBook = booksInIndex.first else { return (nil, nil) }
        let firstCover = UIImage(named: firstBook.cover)
        
        if booksInIndex.count == 2, let lastBook = booksInIndex.last {
            let lastCover = UIImage(named: lastBook.cover)
            return (firstCover, lastCover)
        } else {
            return (firstCover, nil)
        }
    }
    
    /// This function used to get book when tap on column on cell
    /// - Parameter type: Pass type of column
    /// - Parameter indexPath: Pass indexPath
    func getBook(type: ColumnType, indexPath: IndexPath) -> Book? {
        let booksInIndex = books[indexPath.row]

        if type == .first, let firstBook = booksInIndex.first {
            return firstBook
        } else if type == .last, booksInIndex.count == 2, let lastBook = booksInIndex.last {
            return lastBook
        }
        
        return nil
    }
    
}
