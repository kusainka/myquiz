import UIKit

class HistoryTableViewCell: UITableViewCell {
    @IBOutlet weak var attemptLabel: UILabel!
    @IBOutlet weak var quizAnswer: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
