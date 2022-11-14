//
//  InstagramDetailViewController+DataSource.swift
//  WoltersInstagramAPI
//
//  Created by Bocanu Mihai on 14.11.2022.
//

import UIKit

extension InstagramDetailViewController {

    func loadChildrenData(for childrens: [MediaData]) {
        childrens.forEach({
            let urlString = String(format: InstagramLinks.childrenUrl, $0.id, InstagramLinks.accesToken)
            if let url = URL(string: urlString) {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase

               URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                   guard let self = self else { return }
                  if let data = data {
                      do {
                         let res = try decoder.decode(InstagramItem.self, from: data)
                          self.detailItems.append(res)
                           DispatchQueue.main.async {
                              self.instagramDetailTableView.reloadData()
                           }
                      } catch let error {
                          //log error instead of printing
                         print("ERROR:", error)
                      }
                   }
               }.resume()
            }
        })
    }
}
