//
//  ViewController.swift
//  quizApp
//
//   Created by  kusainka on 30.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var quizAnswers : [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func didTapStart(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "test") as? TestViewController else{
            print("didtapstart")
            return
        }
        
        vc.title = "attempt Quiz"
        vc.complition = { counterRight in
            self.quizAnswers.append(counterRight)
        }

        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTapHistory(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "history") as? HistoryViewController else{
            print("didtaphistory")
            return
        }
        
        vc.title = "Attempts History"
        vc.array = quizAnswers
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

