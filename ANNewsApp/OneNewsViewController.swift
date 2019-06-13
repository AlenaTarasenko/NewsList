//
//  OneNewsViewController.swift
//  ANNewsApp
//
//  Created by Alena Tarasenko on 12/06/2019.
//  Copyright © 2019 Alena Tarasenko. All rights reserved.
//

import UIKit
import SafariServices

class OneNewsViewController: UIViewController, SFSafariViewControllerDelegate {

    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsDateLabel: UILabel!
    @IBOutlet weak var newsAuthorLabel: UILabel!
    @IBOutlet weak var pushOpenButton: UIButton!
    @IBOutlet weak var newsDescriptorTextView: UITextView!
    @IBOutlet weak var loadIndicator: UIActivityIndicatorView!
    
    var article: Article!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let article = article {
            newsTitleLabel.text = article.title
            newsDateLabel.text = article.publishedAt
            newsDescriptorTextView.text = article.description
            newsAuthorLabel.text = article.author
             if URL(string: article.url) == nil {
                pushOpenButton.isHidden = true
                pushOpenButton.isEnabled = true
            }
            
            DispatchQueue.main.async {
                if let urlImage = URL(string: self.article.urlToImage) {
                    if let data: Data = try! Data(contentsOf: urlImage) {
                        self.newsImage.image = UIImage(data: data)
                    }
                }
            }
        }
    }
    
//    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
//        controller.dismiss(animated: true, completion: nil)
//    }
    
    @IBAction func pushOpenButton(_ sender: Any) {
        if let url = URL(string: article.url) {
            let svc = SFSafariViewController(url: url)
           // svc.delegate = self
            present(svc, animated: true, completion: nil)
        }
    }
}
