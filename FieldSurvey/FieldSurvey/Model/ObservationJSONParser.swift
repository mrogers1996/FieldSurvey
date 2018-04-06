//
//  ObservationJSONParser.swift
//  FieldSurvey
//
//  Created by Mandy Rogers on 4/5/18.
//  Copyright © 2018 Mandy Rogers. All rights reserved.
//

import UIKit

class ObservationJSONParser {
    
    static let dateFormatter = DateFormatter()
    
    class func parse(_ data: Data) -> [Observations] {
        var observationsArray = [Observations]()
        
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm"
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: []),
            let root = json as? [String: Any],
            let status = root["status"] as? String,
            status == "ok" {
            
            if let observations = root["observations"] as? [Any] {
                for observation in observations {
                    if let observation = observation as? [String: String] {
                        if let classification = observation["classification"],
                            let title = observation["title"],
                            let description = observation["description"],
                            let dateString = observation["date"],
                            let date = dateFormatter.date(from: dateString) {
                            
                            if let newObservation = Observations(classificationName: classification, title: title, description: description, date: date) {
                                observationsArray.append(newObservation)
                            }
                            print("catch1")
                        }
                        print("catch2")
                    }
                    print("catch3")
                }
                print("catch4")
                
            }
            print("catch5")
            
        }
        
        return observationsArray
    }
    
    
    
}
