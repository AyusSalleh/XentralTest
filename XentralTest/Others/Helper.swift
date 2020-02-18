//
//  Helper.swift
//  XentralTest
//
//  Created by Ayus Salleh on 17/02/2020.
//  Copyright © 2020 Ayus_Salleh. All rights reserved.
//

import UIKit

enum HelperError: String, Error {
    case error = "Something wrong happened!"
}

class Helper: NSObject {

    private var jsonFilePath: URL? {
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else {
            return nil
        }
        
        let pathURL = URL(fileURLWithPath: path)
        return pathURL
    }
    
    /*
     data.json has been changed to correct JSON format due to swift unable to decode single quote. Able to replace the string of json with double quote. But it's not the best way since data inside them maybe have single quote as well
     References: https://stackoverflow.com/questions/36038454/parsing-string-as-json-with-single-quotes
     */
    func getBookData(completion: @escaping (_ books: [Book], _ error: HelperError? )->()) {
        guard let filePath = jsonFilePath else {
            completion([], .error)
            return
        }

        do {
            let data = try Data(contentsOf: filePath)
            let books = try JSONDecoder().decode([Book].self, from: data)
            completion(books, nil)
        } catch {
            completion([], .error)
        }
    }
    
}
