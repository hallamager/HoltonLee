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
    
    
    @IBOutlet weak var infoTextField: UITextView!
    @IBOutlet weak var MapeImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        
        foregroundView.layer.cornerRadius = 5
        foregroundView.layer.masksToBounds = true
        
        
        super.awakeFromNib()
    }
    
    func setUpCell() {
        nameLabel.text = route.name
        infoTextField.text = route.info
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
