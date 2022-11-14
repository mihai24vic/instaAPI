//
//  InstagramDetailViewController+Config.swift
//  WoltersInstagramAPI
//
//  Created by Bocanu Mihai on 14.11.2022.
//

import UIKit

extension InstagramDetailViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        detailItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "instagramDetailTableViewCellID") as! InstagramDetailViewCell
        let item = detailItems[indexPath.row]
        let time = String().formatDateFromString(from: item.timestamp)

        cell.mediaId.text = item.id
        cell.picture.downloaded(from: item.mediaUrl)
        cell.timestamp.text = time
        return cell
    }
}
