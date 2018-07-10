//
//  HTMLParser.swift
//  HTMLParserDemo
//
//  Created by Robert Wong on 6/2/18.
//  Copyright © 2018 Robert Wong. All rights reserved.
//

import Foundation
import Alamofire
import SwiftSoup

class HTMLGet {
    
    var bookTitle: String = ""
    
    func getBookTitle(isbn: String, completion: @escaping (String) -> ()) {
        let isbnString = "https://isbndb.com/search/books/\(isbn)"
        Alamofire.request(isbnString).responseString { response in
            if let html = response.result.value {
                do {
                    let doc: Document = try! SwiftSoup.parse(html)
                    let link = try! doc.select("a").array()
                    let bookTitle: String = try! link[10].text()
                    //print(bookTitle)
                    completion(bookTitle)
                } catch {
                    print("Error in finding book title")
                }
            }
        }
    }   
}

