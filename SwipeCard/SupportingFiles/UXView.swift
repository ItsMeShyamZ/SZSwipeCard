//
//  UXView.swift
//  SwipeCard
//
//  Created by Abservetech on 30/12/19.
//  Copyright © 2019 Abservetech. All rights reserved.
//
import UIKit

extension UIView{
    var isElevation : Bool {
        get{
            return self.isElevation
        }
        set{
            if newValue{
                self.layer.cornerRadius = 10
                self.layer.shadowColor = UIColor.gray.cgColor
                self.layer.shadowRadius = 2
                self.layer.shadowOpacity = 0.5
            }
        }
    }
}
