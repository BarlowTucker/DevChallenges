//
//  Challenge.swift
//  DevChallenges
//
//  Created by Barlow Tucker on 5/6/16.
//  Copyright © 2016 Barlow Tucker. All rights reserved.
//

import UIKit

struct Challenge {
    let image: UIImage
    let title: String
    let description: String
    let ordinal: Int
    let date: NSDate
    let appURL:NSURL?
    
    var subtitle: String {
        return "\(NSLocalizedString("Challenge", comment: "Challenge")) \(ordinal)"
    }
    
    init(ordinal:Int, date:NSDate, url:NSURL?) {
        let key = "challenge\(ordinal)"
        self.title = NSLocalizedString("\(key)-title", comment: "Challenge Title")
        self.description = NSLocalizedString("\(key)-description", comment: "Challenge Description")
        self.ordinal = ordinal
        self.date = date
        self.appURL = url
        
        if let image = UIImage(named: key) {
            self.image = image
        } else {
            self.image = UIImage(named: "placeholder")!
        }
    }
    
    static func challenges() -> [String:[Challenge]] {
        var challengeGroups:[String:[Challenge]] = [:]
        
        guard let path = NSBundle.mainBundle().pathForResource("challengeList", ofType: "plist"),
            let dictionary = NSDictionary(contentsOfFile: path),
            let array = dictionary["Challenges"] as? NSArray else { return challengeGroups }
        
        for group in array {
            guard let challengeGroup = group as? NSDictionary,
                let groupTitle = challengeGroup["title"] as? String,
                let items = challengeGroup["challenges"] as? NSArray else { continue }
            
            var challenges:[Challenge] = []
            for item in items {
                guard let challengeData = item as? NSDictionary,
                    let ordinal = challengeData["ordinal"] as? Int,
                    let date = challengeData["date"] as? NSDate else { continue }

                let url = challengeData["url"] as? NSURL
                
                let challenge:Challenge = Challenge(ordinal: ordinal, date: date, url:url)
                
                challenges.append(challenge)
            }
            
            challengeGroups[groupTitle] = challenges
        }
        
        return challengeGroups
    }
}
