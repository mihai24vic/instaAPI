//
//  InstagramTableViewController+Actions.swift
//  WoltersInstagramAPI
//
//  Created by Bocanu Mihai on 14.11.2022.
//

import UIKit

extension InstagramTableViewController {
    @objc func callPullToRefresh(){
            self.loadData()
    }
}
