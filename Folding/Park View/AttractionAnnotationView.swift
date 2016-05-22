import UIKit
import MapKit

class AttractionAnnotationView: MKAnnotationView {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        let attractionAnnotation = self.annotation as! AttractionAnnotation
        switch (attractionAnnotation.type) {
        case .AttractionFirstAid:
            image = UIImage(named: "green")
        case .AttractionFood:
            image = UIImage(named: "green")
        case .AttractionRide:
            image = UIImage(named: "green")
        default:
            image = UIImage(named: "green")
        }
    }
}