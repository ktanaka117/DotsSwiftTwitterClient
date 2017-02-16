//
//  TweetParser.swift
//  DotsSwiftTwitterClient
//
//  Created by 田中賢治 on 2017/02/15.
//  Copyright © 2017年 田中賢治. All rights reserved.
//

import Foundation

struct TweetParser {
    
    func parse(data: Data) -> [Tweet] {
        let serializedData = try! JSONSerialization.jsonObject(with: data, options: .allowFragments)
        let json = serializedData as! [Any]
            
        let tweets = json.map {
            Tweet(json: $0)!
        }.filter {
            $0 != nil
        }
        
        return tweets
    }
    
}
