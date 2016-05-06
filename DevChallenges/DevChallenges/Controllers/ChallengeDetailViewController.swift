//
//  ChallengeDetailViewController.swift
//  DevChallenges
//
//  Created by Barlow Tucker on 5/6/16.
//  Copyright © 2016 Barlow Tucker. All rights reserved.
//

import UIKit

class ChallengeDetailViewController: UIViewController {
    @IBOutlet weak var challengeImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    
    var challenge:Challenge?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let challenge = self.challenge else { return }
        
        self.challengeImageView.image = challenge.image
        self.titleLabel.text = challenge.title
        self.descriptionLabel.text = challenge.description
        self.subtitleLabel.text = challenge.subtitle
    }

    @IBAction func actionTapped(sender: AnyObject) {
    }
}
