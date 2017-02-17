//
//  Twitter.swift
//  DotsSwiftTwitterClient
//
//  Created by 田中賢治 on 2017/02/15.
//  Copyright © 2017年 田中賢治. All rights reserved.
//

import Foundation

struct Tweet {
    
    // ツイートのid
    let id: String
    
    // ツイートの本文
    let text: String
    
    // このツイートを発言したユーザー
    let user: User
    
    init(id: String, text: String, user: User) {
        self.id = id
        self.text = text
        self.user = user
    }
    
    init?(json: Any) {
        guard let dictionary = json as? [String: Any] else { return nil }
        
        guard let id = dictionary["id_str"] as? String else { return nil }
        guard let text = dictionary["text"] as? String else { return nil }
        guard let userJSON = dictionary["user"] else { return nil }
        guard let user = User(json: userJSON) else { return nil }
        
        self.id = id
        self.text = text
        self.user = user
    }
    
}
