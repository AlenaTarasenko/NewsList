//
//  Article.swift
//  ANNewsApp
//
//  Created by Alena Tarasenko on 12/06/2019.
//  Copyright © 2019 Alena Tarasenko. All rights reserved.
//

//
//-"source": {
//    "id": null,
//    "name": "Gizmodo.com"
//},
//"author":
//"title":
//"url":
//"urlToImage":
//"publishedAt":
//"content": 
//},

import Foundation

struct Article {
    var author: String
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: String
    var sorceName: String
    
    init(dictionary: Dictionary<String , Any>) {
        author      = dictionary["author"] as? String ?? ""
        title       = dictionary["title"] as? String ?? ""
        description = dictionary["description"] as? String ?? ""
        url         = dictionary["url"] as? String ?? ""
        urlToImage  = dictionary["urlToImage"] as? String ?? ""
        publishedAt = dictionary["publishedAt"] as? String ?? ""
        sorceName   = (dictionary["source"] as? Dictionary<String, Any> ?? ["":""])["name"] as? String ?? ""
    }
    
}
