//
//  ViewController.swift
//  DevChallenges
//
//  Created by Barlow Tucker on 5/6/16.
//  Copyright © 2016 Barlow Tucker. All rights reserved.
//

import UIKit

class ChallengeListViewController: UIViewController {
    private var challenges: [String:[Challenge]] = Challenge.challenges()
    private var selectedChallenge:Challenge?
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        guard let viewController = segue.destinationViewController as? ChallengeDetailViewController where segue.identifier == "ShowDetail" else { return }
        
        viewController.challenge = self.selectedChallenge
        self.navigationItem.title = NSLocalizedString("title", comment: "List Title")
    }

}

extension ChallengeListViewController: UITableViewDataSource, UITableViewDelegate {
    private func sectionKey(forSection section:Int) -> String {
        return Array(self.challenges.keys)[section]
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.challenges.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.challenges[self.sectionKey(forSection: section)]!.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let key = self.sectionKey(forSection: section)
        return NSLocalizedString(key, comment: "Section Title")
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let challenges = self.challenges[self.sectionKey(forSection: indexPath.section)]!
        self.selectedChallenge = challenges[indexPath.row]
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        self.performSegueWithIdentifier("ShowDetail", sender: self)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:ChallengeTableViewCell = tableView.dequeueReusableCellWithIdentifier("ChallengeCell", forIndexPath: indexPath) as! ChallengeTableViewCell
        
        let challenges = self.challenges[self.sectionKey(forSection: indexPath.section)]!
        let challenge = challenges[indexPath.row]
        
        cell.previewImageView.image = challenge.image
        cell.titleLabel.text = challenge.title
        cell.descriptionLabel.text = challenge.subtitle
        
        return cell
    }
}
