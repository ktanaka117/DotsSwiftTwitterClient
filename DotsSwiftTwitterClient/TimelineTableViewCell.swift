//
//  TimelineTableViewCell.swift
//  DotsSwiftTwitterClient
//
//  Created by 田中賢治 on 2017/02/15.
//  Copyright © 2017年 田中賢治. All rights reserved.
//

import UIKit

class TimelineTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var textContentLabel: UILabel!
    
    func fill(tweet: Tweet) {
        
        let downloadTask = URLSession.shared.dataTask(with: URL(string: tweet.user.profileImageURL)!) { [weak self] data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                self?.iconImageView.image = UIImage(data: data!)
            }
        }
        downloadTask.resume()
        
        nameLabel.text = tweet.user.name
        screenNameLabel.text = "@" + tweet.user.screenName
        textContentLabel.text = tweet.text
    }
    
}
