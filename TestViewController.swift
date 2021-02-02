import UIKit

class TestViewController: UIViewController {
    
    
    @IBOutlet weak var imageViewTest: UIImageView!
    
    
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    
    
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    
    
    // set of questions and answers for prev button
    var questions = [Question]()
    var questionAnswer = [QuestionAnswer]()
    
    // callback for history
    public var complition: ((Int) -> Void)?
    
    // counters for check number of right answers, questions
    // counter for previous --> is to check
    private var counter : Int = 0
    private var counterForPrev : Int = 0
    private var counterRight : Int = 0
    private var counterForCheckIsbuttonSelected : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataConfigure()
        self.setQuestions()
    }
    

    

    
    @IBAction func answer1Tap(_ sender: Any) {
        self.disableButtons()
        self.counterForCheckIsbuttonSelected += 1
        if self.isRightbuttonTapped(button_number: 0){
            self.answer1Button.backgroundColor = UIColor.green
            self.counterRight += 1
            self.answerSave(q: self.questions[self.counter], num: 0, isRight: true)
        }
        else{
            self.answer1Button.backgroundColor = UIColor.red
            self.answerSave(q: self.questions[self.counter], num: 0, isRight: false)
        }
    }
    
    @IBAction func answer2Tap(_ sender: Any) {
        self.disableButtons()
        self.counterForCheckIsbuttonSelected += 1
        if self.isRightbuttonTapped(button_number: 1){
            self.answer2Button.backgroundColor = UIColor.green
            self.counterRight += 1
            self.answerSave(q: self.questions[self.counter], num: 1, isRight: true)
        }
        else{
            self.answer2Button.backgroundColor = UIColor.red
            self.answerSave(q: self.questions[self.counter], num: 1, isRight: false)
        }
    }
    
    @IBAction func answer3Tap(_ sender: Any) {
        self.disableButtons()
        self.counterForCheckIsbuttonSelected += 1
        if self.isRightbuttonTapped(button_number: 2){
            self.answer3Button.backgroundColor = UIColor.green
            self.counterRight += 1
            self.answerSave(q: self.questions[self.counter], num: 2, isRight: true)
        }
        else{
            self.answer3Button.backgroundColor = UIColor.red
            self.answerSave(q: self.questions[self.counter], num: 2, isRight: false)
        }
    }
    
    @IBAction func answer4Tap(_ sender: Any) {
        self.disableButtons()
        self.counterForCheckIsbuttonSelected += 1
        if self.isRightbuttonTapped(button_number: 3){
            self.answer4Button.backgroundColor = UIColor.green
            self.counterRight += 1
            self.answerSave(q: self.questions[self.counter], num: 3, isRight: true)
        }
        else{
            self.answer4Button.backgroundColor = UIColor.red
            self.answerSave(q: self.questions[self.counter], num: 3, isRight: false)
        }
    }
    
    
    
    
    
    
    @IBAction func nextButtonTap(_ sender: Any) {
        if (self.counter == self.counterForCheckIsbuttonSelected){
            return
        }
        else if (self.counterForPrev < -1){
            self.counterForPrev += 1
            self.setQuestionAnswer(which:  self.questionAnswer.count + self.counterForPrev)
            print(self.counter)
            print(self.counterForPrev)
            print(self.counterRight)
        }
        else if (counter >= questions.count - 1){
            let vc = storyboard?.instantiateViewController(identifier: "end") as! EndQuizViewController
            vc.answer = self.counterRight
            self.complition!(self.counterRight)
            
            
            vc.complition1 = { someDefault in
                self.reset_all()
                self.navigationController?.popToViewController(self, animated: true)
                
            }
            
            self.navigationController?.pushViewController(vc, animated: true)
            
            print(self.counter)
            print(self.counterForPrev)
            print(self.counterRight)
        }
        else if (counter < self.questions.count - 1){
            self.counter += 1
            self.setQuestions()
            print(self.counter)
            print(self.counterForPrev)
            print(self.counterRight)
        }
       
    }

    @IBAction func prevButtonTap(_ sender: Any) {
        if (self.counter == self.counterForCheckIsbuttonSelected){
            return
        }
        else if (self.counterForPrev < (-1) * self.counter){
            return
        }
        else{
            self.counterForPrev -= 1
            self.setQuestionAnswer(which: self.questionAnswer.count + self.counterForPrev)
        }
        print(self.counter)
        print(self.counterForPrev)
        print(self.counterRight)
    }
    
    
    
  
    private func setQuestions(){
        self.imageViewTest.image = UIImage(named: self.questions[self.counter].image_source)
        self.answer1Button.setTitle(self.questions[self.counter].answers[0], for: .normal)
        self.answer2Button.setTitle(self.questions[self.counter].answers[1], for: .normal)
        self.answer3Button.setTitle(self.questions[self.counter].answers[2], for: .normal)
        self.answer4Button.setTitle(self.questions[self.counter].answers[3], for: .normal)
        self.chageColor()
        self.enableButton()
    }
    
 
    
    private func chageColor(){
        self.answer1Button.backgroundColor = UIColor.blue
        self.answer2Button.backgroundColor = UIColor.blue
        self.answer3Button.backgroundColor = UIColor.blue
        self.answer4Button.backgroundColor = UIColor.blue
    }
    
    // ---> enable/disablse buttons
    private func disableButtons(){
        self.answer1Button.isUserInteractionEnabled = false
        self.answer2Button.isUserInteractionEnabled = false
        self.answer3Button.isUserInteractionEnabled = false
        self.answer4Button.isUserInteractionEnabled = false
    }
    
    
    private func enableButton(){
        self.answer1Button.isUserInteractionEnabled = true
        self.answer2Button.isUserInteractionEnabled = true
        self.answer3Button.isUserInteractionEnabled = true
        self.answer4Button.isUserInteractionEnabled = true
    }
    
    // ---> check button with answer
    private func isRightbuttonTapped(button_number : Int) -> Bool{
        if (self.questions[self.counter].right_answer == button_number){
            return true
        }
        return false
    }
    
  
    private func reset_all(){
        self.counter = 0
        self.counterRight = 0
        self.questions = [Question]()
        self.questionAnswer = [QuestionAnswer]()
        self.counterForPrev = 0
        self.setQuestions()
        self.dataConfigure()

                
    }
    
    
  
    private func answerSave(q : Question, num : Int, isRight : Bool){
        let qa = QuestionAnswer(id: q.id, image_source: q.image_source, answers: q.answers, choosen: num, isRight: isRight)
        self.questionAnswer.append(qa)
    }
    
    
    private func setQuestionAnswer(which : Int){
        self.imageViewTest.image = UIImage(named: self.questions[self.counter].image_source)
        self.answer1Button.setTitle(self.questionAnswer[which].answers[0], for: .normal)
        self.answer2Button.setTitle(self.questionAnswer[which].answers[1], for: .normal)
        self.answer3Button.setTitle(self.questionAnswer[which].answers[2], for: .normal)
        self.answer4Button.setTitle(self.questionAnswer[which].answers[3], for: .normal)
        self.chageColor()
        if (self.questionAnswer[which].isRight){
            self.identifybutton(number: self.questionAnswer[which].choosen)?.backgroundColor = UIColor.green
        }else{
            self.identifybutton(number: self.questionAnswer[which].choosen)?.backgroundColor = UIColor.red
        }
        self.disableButtons()
    }
    
 
    private func identifybutton(number : Int) -> UIButton!{
        if (number == 0){
            return self.answer1Button
        }
        else if (number == 1){
            return self.answer2Button
        }
        else if (number == 2){
            return self.answer3Button
        }
        else {
            return self.answer4Button
        }
    }
    
    
    
    func dataConfigure(){
        let q1 = Question(id : 0, image_source: "aktau", answers: ["Aktau", "astana", "Almaty", "dubai"], right_answer: 0)
        self.questions.append(q1)
        
        let q2 = Question(id : 1, image_source: "astana", answers: ["almaty", "astana", "dubai", "paris"], right_answer: 1)
        self.questions.append(q2)
        
        let q3 = Question(id : 2, image_source: "dubai", answers: ["paris", "dubai", "egypt",  "aktau"], right_answer: 1)
        self.questions.append(q3)
        
        let q4 = Question(id : 3, image_source: "almaty", answers: ["aktau", "dubai", "egypt",  "almaty"], right_answer: 3)
        self.questions.append(q4)
        
        let q5 = Question(id : 4, image_source: "egypt", answers: ["egypt", "aktau", "dubai",  "astana"], right_answer: 0)
        self.questions.append(q5)
        
        let q6 = Question(id : 5, image_source: "moscow", answers: ["paris", "astana", "moscow",  "almaty"], right_answer: 2)
        self.questions.append(q6)
        
        let q7 = Question(id : 6, image_source: "paris", answers: ["dubai", "aktau", "egypt",  "paris"], right_answer: 3)
        self.questions.append(q7)
        
        let q8 = Question(id : 7, image_source: "istanbul", answers: ["rome", "istanbul", "london",  "moscow"], right_answer: 1)
        self.questions.append(q8)
                        
        let q9 = Question(id : 8, image_source: "rome", answers: ["rome", "london", "moscow",  "astana"], right_answer: 0)
        self.questions.append(q9)
                
        let q10 = Question(id : 9, image_source: "london", answers: ["aktau", "almaty", "rome",  "london"], right_answer: 3)
        self.questions.append(q10)

        
    }
}
