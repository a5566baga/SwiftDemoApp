//
//  LiveTableViewCell.swift
//  LiveLife
//
//  Created by ben on 16/11/3.
//  Copyright © 2016年 张增强. All rights reserved.
//

import UIKit

class LiveTableViewCell: UITableViewCell {

    @IBOutlet weak var imgPor: UIImageView!
    @IBOutlet weak var nickLabel: UILabel!
    @IBOutlet weak var locationLable: UILabel!
    @IBOutlet weak var viewersLabel: UILabel!
    @IBOutlet weak var bgImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
