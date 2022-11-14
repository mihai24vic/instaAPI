//
//  InstagramTableViewController+DataSource.swift
//  WoltersInstagramAPI
//
//  Created by Bocanu Mihai on 14.11.2022.
//

import Foundation
import UIKit

extension InstagramTableViewController {

    private func showLoadMoreDataView(_ show: Bool) {
        loadMoreDataView.isHidden = show ? false : true
    }

    private func showLoadMoreDataView() {
        showLoadMoreDataView(true)
    }

    func loadData() {
        showLoadMoreDataView()

        let urlString = InstagramLinks.absoluteUrl
        if let url = URL(string: urlString) {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

           URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
               guard let self = self else { return }

              if let data = data {
                  do {
                     let res = try decoder.decode(Profile.self, from: data)
                      self.id = res.id
                      self.instagramItems = res.media.data

                       DispatchQueue.main.async {
                           self.title = res.username
                           self.instagramTableView.refreshControl?.endRefreshing()
                           self.instagramTableView.reloadData()
                           self.showLoadMoreDataView(false)
                        }
                  } catch let error {
                     print("ERROR:", error)
                  }
               }
           }.resume()
        }
    }
}

