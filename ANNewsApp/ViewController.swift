//
//  ViewController.swift
//  ANNewsApp
//
//  Created by Alena Tarasenko on 12/06/2019.
//  Copyright © 2019 Alena Tarasenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var newsTableWiew: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadNews {
            DispatchQueue.main.async {
                self.newsTableWiew.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifire = "cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire, for: indexPath)
        let article = articles[indexPath.row]
        cell.textLabel?.text = article.title
        cell.detailTextLabel?.text = article.publishedAt
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToOneNews" {
            if let indexPath = newsTableWiew.indexPathForSelectedRow {
                (segue.destination as? OneNewsViewController)?.article = articles[indexPath.row]
                newsTableWiew.deselectRow(at: indexPath, animated: false)
            }
        }
    }
}

