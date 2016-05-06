//
//  ChallengeTableViewCell.swift
//  DevChallenges
//
//  Created by Barlow Tucker on 5/6/16.
//  Copyright © 2016 Barlow Tucker. All rights reserved.
//

import UIKit

class ChallengeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
