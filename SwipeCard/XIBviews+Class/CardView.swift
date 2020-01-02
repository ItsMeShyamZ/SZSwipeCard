//
//  CardView.swift
//  SwipeCard
//
//  Created by Abservetech on 30/12/19.
//  Copyright © 2019 Abservetech. All rights reserved.
//

import UIKit

protocol CardViewDelegate {
    func numberOfItems(count : Int,parnteView view : UIView, childView views : UIView )
    func reload()
}

class CardView : UIView,CardViewDelegate{
    func numberOfItems(count: Int,parnteView view : UIView, childView views : UIView ){
       let angle = (view.frame.width/2) / 0.34
        for value in 0...count{
            if value%2 == 0{
//                self.initView(parnteView: view, childView: views, rotationscale: angle, color: .brown)
            }else{
//                self.initView(parnteView: view, childView: views, rotationscale: angle, color: .red)
            }
        }
    }
    
    func reload() {
        print("reloaded")
    }
    
 
    @IBOutlet weak var cardView : UIView!
    @IBOutlet weak var userDetailView : UIView!
    @IBOutlet weak var menuImg : UIImageView!
    @IBOutlet weak var userNameLbl : UILabel!
    @IBOutlet weak var genderLbl : UILabel!
    @IBOutlet weak var likeImage : UIImageView!
    @IBOutlet weak var moreUIView : UIView!
    @IBOutlet weak var moreBtn : UIButton!
    @IBOutlet weak var petNameLbl : UILabel!
    @IBOutlet weak var imagesTableView : UITableView!
    
    
    var originalPoint : CGPoint!
    var isFirstpoint : Bool = false
    var divisor : CGFloat!
    var parentView : UIView!
    var childView : UIView!
    
    func initView(parnteView view : UIView, childView views : UIView ,rotationscale : CGFloat, color : UIColor,moreInfo : @escaping(String)->()){
        self.parentView = view
        self.divisor = rotationscale
        self.childView = views
        self.userDetailView.isElevation = true
        self.moreUIView.isElevation = true
        self.backgroundColor = .clear
        self.frame = views.bounds
        self.autoresizingMask =  [.flexibleWidth, .flexibleHeight]
              
        self.childView.addSubview(self)
        self.childView.bringSubviewToFront(self)
        self.setupDelegate()
        
        
        self.moreBtn.addAction(for: .tap) {
            moreInfo("MoreButton clicked")
        }
    }
    
    @IBAction func PanGuester(_ sender: UIPanGestureRecognizer) {
         let card = sender.view!
        if !isFirstpoint{
            self.isFirstpoint = true
            self.originalPoint = card.center
        }
        let formOrigin = card.center.x - parentView.center.x
    
        let position = sender.translation(in: parentView)
        
        card.center = CGPoint(x: parentView.center.x + position.x, y: self.originalPoint.y + position.y )
        
        self.likeImage.alpha = abs(formOrigin)/parentView.center.x
        
        let scale = min(100/abs(formOrigin), 1)
        card.transform = CGAffineTransform(rotationAngle: formOrigin/divisor).scaledBy(x: scale, y: scale)
        
        if formOrigin > 0 {
            self.likeImage.tintColor = UIColor.green
        }else{
            self.likeImage.tintColor = UIColor.red
        }
        
        if sender.state == UIGestureRecognizer.State.ended{
            
            if formOrigin > 100{
                card.center = CGPoint(x: parentView.center.x + position.x + 300, y: self.originalPoint.y + position.y)
                
                self.removeFromSuperview()
                return
            }else if formOrigin < -100{
                card.center = CGPoint(x: parentView.center.x + position.x - 350, y: self.originalPoint.y + position.y)
                
                self.removeFromSuperview()
                return
            }
            
            UIView.animate(withDuration: 0.2) {
                card.center = self.originalPoint
                self.likeImage.alpha = 0
                self.cardView.transform = .identity
            }
        }
    }
    
    @IBAction func MoreBtnAction(_ sender: Any) {
        print("MoreButton_Data")
        
    }
    
    class var loadView: CardView{
        return UINib(nibName: "CardView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! CardView
    }
    
}


extension CardView : UITableViewDelegate , UITableViewDataSource{
    
    func setupDelegate(){
        self.imagesTableView.delegate = self
        self.imagesTableView.dataSource = self
        self.imagesTableView.register(UINib(nibName: "PetImagesCell", bundle: nil), forCellReuseIdentifier: "PetImageCell")
        self.imagesTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PetImageCell") as! PetImageCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.cardView.frame.height - 180
    }
    
    
}



