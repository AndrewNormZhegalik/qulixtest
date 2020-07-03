//
//  ViewController.swift
//  NewsApp
//
//  Created by Monya on 7/2/20.
//  Copyright © 2020 Zhegalik.Inc. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    //let provider = MoyaProvider<NewsApi>()
    
    var articles = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "tableViewCell")
        
        NetworkManager.makeRequest(url: "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=04009b9480044ccd89b9f56973388315", completionHandler: {
            data in
            self.parse(data: data)
        })
        
        
        tableView.separatorStyle = .none
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! TableViewCell
        
        let urlToImage = articles[indexPath.row]["urlToImage"] as! String
        cell.textView.text = articles[indexPath.row]["description"] as! String
        
        print(urlToImage)
        
        NetworkManager.makeRequest(url: urlToImage, completionHandler: {data in
            DispatchQueue.main.async {
                cell.imgView.image = UIImage(data: data, scale: 1)!
            }
        })
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! TableViewCell
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "NewsViewController") as! NewsViewController
        
        controller.sampleURL = articles[indexPath.row]["url"] as! String
        print("sample : " + controller.sampleURL)
        
        self.present(controller, animated: true)
    }
}

extension ViewController {
    func parse(data: Data) {
        do {
            guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return }
            if let articles = json["articles"] as? [[String:Any]] {
                self.articles = articles
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
         } catch {
            print("error")
        }
        
    }
}

