//
//  ObservationJSONLoader.swift
//  FieldSurvey
//
//  Created by Mandy Rogers on 4/5/18.
//  Copyright © 2018 Mandy Rogers. All rights reserved.
//

import UIKit

class ObservationJSONLoader {
    
    class func load(fileName: String) -> [Observations] {
        var observations = [Observations]()
        
        if let path = Bundle.main.path(forResource: fileName, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            observations = ObservationJSONParser.parse(data)
        }
        print("COUNT\(observations.count)")
        return observations
    }
}
