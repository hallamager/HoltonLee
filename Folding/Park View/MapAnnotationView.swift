import UIKit
import MapKit

class MapAnnotationView: MKAnnotationView {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        let mapAnnotation = self.annotation as! MapAnnotation
        switch (mapAnnotation.type) {
        case .Reception:
            image = UIImage(named: "red")
        case .Toilets:
            image = UIImage(named: "red")
        case .BirdHide:
            image = UIImage(named: "red")
        case .ViewPoint:
            image = UIImage(named: "red")
        case .IronAgeHut:
            image = UIImage(named: "red")
        case .SpinalCareFacility:
            image = UIImage(named: "red")
        case .Parking:
            image = UIImage(named: "red")
        default:
            image = UIImage(named: "red")
        }
    }
}