//
//  Model.swift
//  ANNewsApp
//
//  Created by Alena Tarasenko on 12/06/2019.
//  Copyright © 2019 Alena Tarasenko. All rights reserved.
//

import Foundation

let newsURLString = "https://newsapi.org/v2/everything?q=bitcoin&from=2019-05-12&sortBy=publishedAt&apiKey=96475ea51678434fb6c119097fbdfe40"

var articles: [Article] = []
var urlToData: URL {
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0] + "/data.json"
    let urlPath = URL(fileURLWithPath: path)
    
    return urlPath
}

func loadNews(completionHandler: (() -> Void)?) {
    let url = URL(string: newsURLString)
    let session = URLSession(configuration: .default)
   let downloadTask = session.downloadTask(with: url!) { (urlFile, responce, error) in
        if urlFile != nil {
           try? FileManager.default.copyItem(at: urlFile!, to: urlToData)
            parseNews()
            completionHandler?()
        }
    }
    downloadTask.resume()
}

func parseNews () {
    let data = try? Data(contentsOf: urlToData)
    if data == nil {
        return
    }
    let rootDictionaryAny = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
    if rootDictionaryAny == nil {
        return
    }
    let rootDictionary = rootDictionaryAny as? Dictionary<String, Any>
    if rootDictionary == nil {
        return
    }
    if  let array = rootDictionary!["articles"] as? [Dictionary<String, Any>] {
        var returnArray: [Article] = []
        for dict in array {
            let newArticle = Article(dictionary: dict)
            returnArray.append(newArticle)
        }
        articles = returnArray
    }
    
}
