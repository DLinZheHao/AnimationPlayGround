//
//  AnimationDataCell.swift
//  AnimationPlayGround
//
//  Created by 林哲豪 on 2023/9/14.
//

import UIKit

class AnimationDataCell: UITableViewCell {

    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setValueIntoLabel(_ type: String, _ name: String) {
        typeLabel.text = type
        nameLabel.text = name
    }
}
