//
//  Route.swift
//  Folding
//
//  Created by Kyle Goslan on 10/05/2016.
//  Copyright © 2016 Kyle Goslan. All rights reserved.
//

import UIKit
import CoreLocation

class Route {
    
    let name: String!
    let foldingName: String!
    let duration: String!
    let info: String!
    let terrainInfo: String!
    let terrainImage: String!
    let mapRouteImage: String!
    let color: UIColor!
    let colordiff: String!

    
    init(name: String, foldingName: String, duration: String, info: String, terrainInfo: String, terrainImage: String, mapRouteImage: String, color: UIColor, colorDiff: String) {
        self.name = name
        self.foldingName = foldingName
        self.duration = duration
        self.info = info
        self.terrainInfo = terrainInfo
        self.terrainImage = terrainImage
        self.mapRouteImage = mapRouteImage
        self.color = color
        self.colordiff = colorDiff
    }
    
}


func buildRoutes() -> [Route] {
    var routes = [Route]()

    routes.append(Route(name: "Sensory Path",
        foldingName: "Sensory Path",
        duration: "15 MINS",
        info: "Take a journey through the estate's varied environments",
        terrainInfo: "Variable path surface, some grassed areas",
        terrainImage: "terrainImage1",
        mapRouteImage: "mapRouteImage1",
        color: UIColor(redX: 255, greenX: 181, blueX: 90, alphaX: 1),
        colorDiff: "green"
        )
    )
    routes.append(Route(name: "Bird Hide Path",
        foldingName: "Bird Hide Path",
        duration: "5 MINS",
        info: "Take a journey through the estate's varied environments",
        terrainInfo: "Variable path surface, some wet areas",
        terrainImage: "terrainImage1",
        mapRouteImage: "mapRouteImage2",
        color: UIColor(redX: 225, greenX: 229, blueX: 90, alphaX: 1),
        colorDiff: "green"
        )
    )
    routes.append(Route(name: "The Clump Path",
        foldingName: "The Clump Path",
        duration: "10 MINS",
        info: "Take a journey through the estate's varied environments",
        terrainInfo: "Variable path surface, some dry areas",
        terrainImage: "terrainImage1",
        mapRouteImage: "mapRouteImage1",
        color: UIColor(redX: 90, greenX: 193, blueX: 242, alphaX: 1),
        colorDiff: "orange"
        )
    )
    routes.append(Route(name: "The Clump Fields",
        foldingName: "The Clump Fields",
        duration: "15 MINS",
        info: "Take a journey through the estate's varied environments",
        terrainInfo: "Variable path surface, some muddy areas",
        terrainImage: "terrainImage1",
        mapRouteImage: "mapRouteImage1",
        color: UIColor(redX: 171, greenX: 53, blueX: 204, alphaX: 1),
        colorDiff: "orange"
        )
    )
    routes.append(Route(name: "Heathland Path",
        foldingName: "Heathland Path",
        duration: "25 MINS",
        info: "Take a journey through the estate's varied environments",
        terrainInfo: "Variable path surface, some epic areas",
        terrainImage: "terrainImage1",
        mapRouteImage: "mapRouteImage1",
        color: UIColor(redX: 242, greenX: 12, blueX: 43, alphaX: 1),
        colorDiff: "red"
        )
    )
    
    return routes
}

