//
//  MRTListViewCell.swift
//  MRTStation
//
//  Created by soslab on 2016/5/12.
//  Copyright © 2016年 soslab. All rights reserved.
//

import UIKit

class MRTListViewCell: UITableViewCell {
    
    @IBOutlet weak var MRTStationName: UILabel!
    @IBOutlet weak var LineCode1: UILabel!
    @IBOutlet weak var LineCode2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
