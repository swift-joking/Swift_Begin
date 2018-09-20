//
//  RefreshTableViewController.swift
//  7.Refresh
//
//  Created by 倩倩 on 2018/9/20.
//  Copyright © 2018年 Swifter. All rights reserved.
//

import UIKit

class RefreshTableViewController: UITableViewController {
    
    let favoriteEmoji = ["🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"]
    let newFavoriteEmoji = ["🏃🏃🏃🏃🏃", "💩💩💩💩💩", "👸👸👸👸👸", "🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆" ]
    var isRefresh = true
    var emojiData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Refresh"
        
        emojiData = favoriteEmoji
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        // initial is needed
        refreshControl = UIRefreshControl()
        refreshControl?.backgroundColor = UIColor(red:0.113, green:0.113, blue:0.145, alpha:1)
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        refreshControl?.attributedTitle = NSAttributedString(string: "Last updated on \(Date())", attributes: attributes)
        refreshControl?.tintColor = UIColor.white
        refreshControl?.addTarget(self, action: #selector(changeData), for: .valueChanged)
    }
    
    @objc fileprivate func changeData() {
        emojiData = isRefresh ? newFavoriteEmoji : favoriteEmoji;
        isRefresh = !isRefresh
        tableView.reloadData()
        refreshControl?.endRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.textLabel!.text = emojiData[indexPath.row];
        cell.textLabel!.textAlignment = NSTextAlignment.center
        cell.textLabel!.font = UIFont.systemFont(ofSize: 50)
        cell.backgroundColor = UIColor.clear
        
        return cell
    }
}
