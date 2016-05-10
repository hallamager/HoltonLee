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
    let foldingName: String!
    let duration: String!
    let info: String!
    let terrainInfo: String!
    let terrainImage: String!
    

    
    init(name: String, foldingName: String, duration: String, info: String, terrainInfo: String, terrainImage: String) {
        self.name = name
        self.foldingName = foldingName
        self.duration = duration
        self.info = info
        self.terrainInfo = terrainInfo
        self.terrainImage = terrainImage
    }
    
}


func buildRoutes() -> [Route] {
    var routes = [Route]()

    let sensoryPath = Route(name: "Sensory Path", foldingName: "Sensory Path", duration: "10 MINS", info: "HI", terrainInfo: "", terrainImage: "")
    routes.append(sensoryPath)

    let birdHidePath = Route(name: "Bird Hide Path", foldingName: "Sensory Path", duration: "20 MINS", info: "HI", terrainInfo: "", terrainImage: "")
    routes.append(birdHidePath)
    
    let theClumpPath = Route(name: "The Clump Path", foldingName: "Sensory Path", duration: "15 MINS", info: "HI", terrainInfo: "", terrainImage: "")
    routes.append(theClumpPath)
    
    let beeHivePath = Route(name: "Bee Hive Path", foldingName: "Sensory Path", duration: "12 MINS", info: "HI", terrainInfo: "", terrainImage: "")
    routes.append(beeHivePath)
    
    let heathlandPath = Route(name: "Heathland path", foldingName: "Sensory Path", duration: "18 MINS", info: "HI", terrainInfo: "", terrainImage: "")
    routes.append(heathlandPath)
    
    
    return routes
}

