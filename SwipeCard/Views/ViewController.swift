

import UIKit

class ViewController: UIViewController {
    
    class func initWithStory()->ViewController{
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        return vc
    }
    
    @IBOutlet weak var multipleCard : UIView!
    
    var originalPoint : CGPoint!
    var isFirstpoint : Bool = false
    var divisor : CGFloat!
    
    var petCount : Int = 3
    
    
    @IBAction func resetButton(_ sender: Any) {
        resetCard()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.divisor = (self.view.frame.width/2) / 0.34
        
        self.addCardView()
    }
    
    func addCardView(){
        
        for i in 0..<petCount{
            CardView.loadView.initView(parnteView: self.view, childView: self.multipleCard, rotationscale: self.divisor, color: .orange,moreInfo: {(value) in
                let vc = PetDetailVC.initWithStory()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            })
        }
    }
    
    func resetCard(){
        self.addCardView()
    }
    
    
}

