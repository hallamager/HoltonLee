//
//  Route.swift
//  Folding
//
//  Created by Kyle Goslan on 10/05/2016.
//  Copyright © 2016 Kyle Goslan. All rights reserved.
//

import Foundation
import CoreLocation

class Route {
    
    let name: String!
    let duration: String!
    let info: String!
    

    
    init(name: String, duration: String, info: String) {
        self.name = name
        self.duration = duration
        self.info = info
    }
    
}


func buildRoutes() -> [Route] {
    var routes = [Route]()

    let sensoryPath = Route(name: "Sensory Path", duration: "I have 12-13 feet tall hips. My hips would have been twice as tall as a tall man.", info: "HI")
    routes.append(sensoryPath)

    let birdHidePath = Route(name: "Bird Hide Path", duration: "I have 12-13 feet tall hips. My hips would have been twice as tall as a tall man.", info: "HI")
    routes.append(birdHidePath)
    
    let theClumpPath = Route(name: "The Clump Path", duration: "I have 12-13 feet tall hips. My hips would have been twice as tall as a tall man.", info: "HI")
    routes.append(theClumpPath)
    
    let beeHivePath = Route(name: "Bee Hive Path", duration: "I have 12-13 feet tall hips. My hips would have been twice as tall as a tall man.", info: "HI")
    routes.append(beeHivePath)
    
    let heathlandPath = Route(name: "Heathland path", duration: "I have 12-13 feet tall hips. My hips would have been twice as tall as a tall man.", info: "HI")
    routes.append(heathlandPath)
    
    
    return routes
}

