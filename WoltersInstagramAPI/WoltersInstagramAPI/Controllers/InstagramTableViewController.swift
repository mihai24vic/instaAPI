
import UIKit

class InstagramTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var instagramTableView: UITableView!
    @IBOutlet weak var loadMoreDataView: UIView!

    var instagramItems = [InstagramItem]()
    var instagramChildrenItems = [InstagramItem]()
    var instagramUsername = String()
    var id = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        instagramTableView.refreshControl = UIRefreshControl()
        instagramTableView.refreshControl?.addTarget(self, action: #selector(callPullToRefresh), for: .valueChanged)
    }
}
