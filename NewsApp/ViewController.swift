//
//  ViewController.swift
//  NewsApp
//
//  Created by Satyam Singh on 02/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newsTxt: UILabel!
    
    var articles: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "News"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tableRegister()
        self.fetchNews()
        DispatchQueue.main.async {
            
            self.tableView.reloadData()
        }
        
        /* func navigateToDetailSPage() {
            guard let ViewController = self.storyboard?.instantiateViewController(identifier: "DetailsPageViewController") as? DetailsPageViewController else {
                fatalError("Failed to instantiate")
            }
            self.navigationController?.pushViewController(ViewController, animated: true)
        }
         */
        
        // Do any additional setup after loading the view.
    }
    
    func tableRegister() {
        let nib = UINib(nibName: "NewsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "NewsTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func fetchNews() {
        NetworkManager.getData { articles, error in
            DispatchQueue.main.async {
                
                
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                if let articles {
                    self.articles = articles
                }
                self.tableView.reloadData()
            }
        }
    }
}



// MARK: UITableViewDelegate, UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell" , for: indexPath) as? NewsTableViewCell
        
        cell?.titletxt.text = articles[indexPath.row].title
        cell?.descriptionTxt.text = articles[indexPath.row].description
        cell?.imageUrlStr = articles[indexPath.row].urlToImage
        cell?.selectionStyle = .none
        cell?.config()
        
        
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        guard let detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailsPageViewController") as? DetailsPageViewController else {
                fatalError("Failed to instantiate DetailsPageViewController from storyboard.")
            }
            // Set the selected item to the detail view controller
        detailViewController.newsItem = articles[indexPath.row]
            // Push the detail view controller onto the navigation stack
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}
