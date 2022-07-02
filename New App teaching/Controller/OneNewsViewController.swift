//
//  OneNewsViewController.swift
//  New App teaching
//
//  Created by Кирилл on 29.06.2022.
//

import UIKit
import SafariServices

class OneNewsViewController: UIViewController {
    var article : Article!
    var index : Int = 0 
    @IBOutlet var imageViewOneNews: UIImageView!
    @IBOutlet var titleOneNews: UILabel!
    @IBOutlet var discriptionOneNews: UILabel!
    @IBOutlet var refresh: UIActivityIndicatorView!
    
    @IBOutlet var openWebOutlet: UIButton!
    @IBAction func puskOpenWeb(_ sender: Any) {
        if let url = URL(string: article.url) {
        let svc = SFSafariViewController(url: url)
        present(svc, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleOneNews.text = article.title
        discriptionOneNews.text = article.description
        
        DispatchQueue.main.async {
            if let url = URL(string: self.article.urlToImage) {
                if let data =  try? Data(contentsOf: url ){
                    if let image = UIImage(data: data ){
                        self.imageViewOneNews.image = image
                    }else{
                        self.refresh.stopAnimating()
                        self.imageViewOneNews.image = UIImage(named: "bmw")
                    }
                }
            }
        }
        if URL(string: article.url) == nil {
//            openWebOutlet.isEnabled = false
            openWebOutlet.isHidden = true
        }
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
