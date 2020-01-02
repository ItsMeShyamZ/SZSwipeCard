//
//  PetDetailVC.swift
//  SwipeCard
//
//  Created by Abservetech on 02/01/20.
//  Copyright © 2020 Abservetech. All rights reserved.
//

import UIKit

class PetDetailVC: UIViewController {
    
    class func initWithStory()->PetDetailVC{
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PetDetailVC") as! PetDetailVC
        return vc
    }
    
    @IBOutlet weak var petImage : UIImageView!
    @IBOutlet weak var backImage : UIImageView!
    @IBOutlet weak var menuImage : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupAction()
    }
    
    func setupView(){
        self.petImage.layer.cornerRadius = self.petImage.frame.width/2
    }
    
    func setupAction(){
        self.backImage.addAction(for: .tap) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
 

}
