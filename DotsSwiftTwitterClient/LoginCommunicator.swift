//
//  LoginCommunicator.swift
//  DotsSwiftTwitterClient
//
//  Created by 田中賢治 on 2017/02/15.
//  Copyright © 2017年 田中賢治. All rights reserved.
//

import Social
import Accounts

struct LoginCommunicator {
    
    func login(handler: @escaping (Bool) -> ()) {
        
        if !SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
            handler(false)
            return
        }
        
        let store = ACAccountStore()
        let type = store.accountType(withAccountTypeIdentifier: ACAccountTypeIdentifierTwitter)
        
        store.requestAccessToAccounts(with: type, options: nil) { granted, error in
            
            // 承認されなかった場合
            guard granted else {
                handler(false)
                return
            }
            
            // 何らかのエラーがあった場合
            if let _ = error {
                handler(false)
                return
            }
            
            let accounts = store.accounts(with: type)
            // TODO: アカウント選択させよう
            if let account = accounts?.first as? ACAccount {
                Account.twitterAccount = account
                handler(true)
            }
        }
        
    }
    
}
