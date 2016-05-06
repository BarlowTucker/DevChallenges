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
    
    init(title:String, description:String, imageName:String?) {
        self.title = title
        self.description = description
        
        if let imageName = imageName, let image = UIImage(named: imageName) where !imageName.isEmpty {
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
                    let title = challengeData["title"] as? String,
                    let description = challengeData["description"] as? String else { continue }

                let imageName = challengeData["imageName"] as? String
                let challenge:Challenge = Challenge(title: title, description: description, imageName: imageName)
                challenges.append(challenge)
            }
            
            challengeGroups[groupTitle] = challenges
        }
        
        return challengeGroups
    }
}
