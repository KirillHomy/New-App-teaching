//
//  PageViewController.swift
//  New App teaching
//
//  Created by Кирилл on 29.06.2022.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    
    @IBAction func refresh(_ sender: Any) {
        loadFunc {
            DispatchQueue.main.async {
                if let vc = self.pageViewController(for: 0){
                self.setViewControllers([vc], direction:.forward, animated: false, completion: nil)
                    
            }
            }
        }
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index =  ((viewController as! OneNewsViewController).index ) - 1
        return self.pageViewController(for: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index =  ((viewController as! OneNewsViewController).index ) + 1

        return self.pageViewController(for: index)
    }
    func pageViewController(for index : Int)-> OneNewsViewController? {
        if index < 0 {
            return nil
        }
        if index >= articles.count{
            return nil 
        }
       let vc = (storyboard?.instantiateViewController(withIdentifier: "oneNewsSID") as! OneNewsViewController)
        vc.article = articles[index]
        vc.index = index
        return vc
        
        
    }
    
    func showViewControllers () {
        DispatchQueue.main.async {
            if let vc = self.pageViewController(for: 0){
            self.setViewControllers([vc], direction:.forward, animated: false, completion: nil)
        }
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.showViewControllers()
        loadFunc {
            self.showViewControllers()
        }
        
        
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
