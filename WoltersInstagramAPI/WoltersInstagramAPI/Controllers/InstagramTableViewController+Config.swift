//
//  InstagramTableViewController+Config.swift
//  WoltersInstagramAPI
//
//  Created by Bocanu Mihai on 14.11.2022.
//

import UIKit

extension InstagramTableViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return instagramItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "instagramTableViewCellID") as!  InstagramTableViewCell
        let item = instagramItems[indexPath.row]
        let time = String().formatDateFromString(from: item.timestamp)

        cell.picture.downloaded(from: item.mediaUrl)
        cell.idLabel.text = item.id
        cell.timestampLabel.text = time
        cell.mediaTyepLabel.text = item.mediaType

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detailSegue", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if(segue.identifier == "detailSegue") {
            let indexPath = self.instagramTableView.indexPathForSelectedRow!
            let instagramTableViewDetail = segue.destination as? InstagramDetailViewController
            let selectedItem = instagramItems[indexPath.row]

            instagramTableViewDetail?.detailItems = [selectedItem]
            self.instagramTableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
