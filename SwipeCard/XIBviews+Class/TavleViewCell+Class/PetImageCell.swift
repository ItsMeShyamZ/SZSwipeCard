//
//  PetImageCellTableViewCell.swift
//  SwipeCard
//
//  Created by Abservetech on 01/01/20.
//  Copyright © 2020 Abservetech. All rights reserved.
//

import UIKit

class PetImageCell: UITableViewCell {
    
    @IBOutlet weak var petImage : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor  = .orange
        self.petImage.layer.cornerRadius = self.petImage.frame.height/2
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
