import UIKit

class HistoryViewController: UIViewController {
    
    var array : [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    
    
    
}


extension HistoryViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.array.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = String(array[indexPath.row]) + "/10"
        return cell
    }
    
    
}
