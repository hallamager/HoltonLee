//
//  MyCell.swift
//  Folding
//
//  Created by Kyle Goslan on 10/05/2016.
//  Copyright © 2016 Kyle Goslan. All rights reserved.
//

import UIKit
import FoldingCell
import MapKit

class RouteCell: FoldingCell {
    
    var route: Route!
    
    
    @IBOutlet weak var mapRouteImage: UIImageView!
    @IBOutlet weak var terrainImage: UIImageView!
    @IBOutlet weak var pathImage: UIImageView!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var foldingNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoTextField: UITextView!
    @IBOutlet weak var MapeImage: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    override func awakeFromNib() {
        
        foregroundView.layer.cornerRadius = 5
        foregroundView.layer.masksToBounds = true
        
        
        super.awakeFromNib()
    }
    
    func setUpCell() {
        foldingNameLabel.text = route.foldingName
        nameLabel.text = route.name
        infoTextField.text = route.info
        durationLabel.text = route.duration
        infoLabel.text = route.terrainInfo
        pathImage.image = UIImage(named: route.name)
        terrainImage.image = UIImage(named: route.terrainImage)
        mapRouteImage.image = UIImage(named: route.mapRouteImage)
    }
    
    
    override func animationDuration(itemIndex:NSInteger, type:AnimationType)-> NSTimeInterval {
        
        // durations count equal it itemCount
        let durations = [0.33, 0.26, 0.26] // timing animation for each view
        return durations[itemIndex]
    }
    
    override func openAnimation(completion completion: CompletionHandler?) {
        super.openAnimation { 
            print("finsihed")
        }
    }
    
}
