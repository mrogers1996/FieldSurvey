//
//  Observations.swift
//  FieldSurvey
//
//  Created by Mandy Rogers on 4/5/18.
//  Copyright © 2018 Mandy Rogers. All rights reserved.
//

import UIKit

struct Observations {
    let classification: Classification
    let title: String
    let description: String
    let date: Date
    
    init(classification: Classification, title: String, description: String, date: Date) {
        self.classification = classification
        self.title = title
        self.description = description
        self.date = date
    }
    
    init?(classificationName: String, title: String, description: String, date: Date) {
        if let classification = Classification(rawValue: classificationName) {
            self.init(classification: classification, title: title, description: description, date: date)
        } else {
            return nil
        }
    }

}
    
    

