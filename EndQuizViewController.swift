import UIKit

class EndQuizViewController: UIViewController {

    @IBOutlet weak var answerLable: UILabel!
    @IBOutlet weak var tryAgainButton: UIButton!
    @IBOutlet weak var homePageButton: UIButton!
    public var complition1: ((Int) -> Void)?
    public var answer : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.answerLable.text = String(self.answer ?? 0) + "0%"
    }
    
    
    
    @IBAction func homePageTap(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    @IBAction func tryAgainTap(_ sender: Any) {
        self.complition1!(0)
    }
     
}
