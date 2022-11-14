//
//  InstagramDetailViewController.swift
//  WoltersInstagramAPI
//
//  Created by Bocanu Mihai on 14.11.2022.
//

import UIKit


class InstagramDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var instagramDetailTableView: UITableView!
    var detailItems = [InstagramItem]()

    override func viewDidLoad() {
        super.viewDidLoad()

        //load children items if any
        if let childrens = detailItems[0].children?.data {
            loadChildrenData(for: childrens)
        }
    }
    
}
