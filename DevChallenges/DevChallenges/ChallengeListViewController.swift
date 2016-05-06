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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ChallengeListViewController: UITableViewDataSource, UITableViewDelegate {
    private func sectionKey(forSection section:Int) -> String {
        return Array(self.challenges.keys)[section]
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.challenges.count
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sectionKey(forSection: section)
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:ChallengeTableViewCell = tableView.dequeueReusableCellWithIdentifier("ChallengeCell", forIndexPath: indexPath) as! ChallengeTableViewCell
        
        let challenges = self.challenges[self.sectionKey(forSection: indexPath.section)]!
        let challenge = challenges[indexPath.row]
        
        cell.previewImageView.image = challenge.image
        cell.titleLabel.text = challenge.title
        cell.descriptionLabel.text = challenge.description
        
        return cell
    }
}
