import UIKit
import MapKit




enum MapType: Int {
  case Standard = 0
  case Hybrid
  case Satellite

}


class ParkMapViewController: UIViewController {
    
    var park = Park(filename: "MagicMountain")
    
    var route: Route?
    
    var color: UIColor!
    
    @IBOutlet weak var mapView: MKMapView!
  
    @IBOutlet weak var mapTypeSegmentedControl: UISegmentedControl!
  
    var selectedOptions = [MapOptionsType]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let latDelta = park.overlayTopLeftCoordinate.latitude -
            park.overlayBottomRightCoordinate.latitude
        
        // think of a span as a tv size, measure from one corner to another
        let span = MKCoordinateSpanMake(fabs(latDelta), 0.0)
        
        let region = MKCoordinateRegionMake(park.midCoordinate, span)
        
        
        mapView.region = region
        addOverlay()
        
        if route != nil {
            drawRoute()
        }
        
    }
    
    func drawRoute() {
        print(route?.name)
        let thePath = NSBundle.mainBundle().pathForResource(route!.name, ofType: "plist")
        let pointsArray = NSArray(contentsOfFile: thePath!)
        
        let pointsCount = pointsArray!.count
        
        var pointsToUse: [CLLocationCoordinate2D] = []
        
        for i in 0...pointsCount-1 {
            let p = CGPointFromString(pointsArray![i] as! String)
            pointsToUse += [CLLocationCoordinate2DMake(CLLocationDegrees(p.x), CLLocationDegrees(p.y))]
        }
        
        let myPolyline = MKPolyline(coordinates: &pointsToUse, count: pointsCount)
        
        mapView.addOverlay(myPolyline)
    }
    
    func addCharacterLocation() {
        let batmanFilePath = NSBundle.mainBundle().pathForResource("BatmanLocations", ofType: "plist")
        let batmanLocations = NSArray(contentsOfFile: batmanFilePath!)
        let batmanPoint = CGPointFromString(batmanLocations![Int(rand()%4)] as! String)
        let batmanCenterCoordinate = CLLocationCoordinate2DMake(CLLocationDegrees(batmanPoint.x), CLLocationDegrees(batmanPoint.y))
        let batmanRadius = CLLocationDistance(max(5, Int(rand()%40)))
        let batman = Character(centerCoordinate:batmanCenterCoordinate, radius:batmanRadius)
        batman.color = UIColor.blueColor()
        
        let tazFilePath = NSBundle.mainBundle().pathForResource("TazLocations", ofType: "plist")
        let tazLocations = NSArray(contentsOfFile: tazFilePath!)
        let tazPoint = CGPointFromString(tazLocations![Int(rand()%4)] as! String)
        let tazCenterCoordinate = CLLocationCoordinate2DMake(CLLocationDegrees(tazPoint.x), CLLocationDegrees(tazPoint.y))
        let tazRadius = CLLocationDistance(max(5, Int(rand()%40)))
        let taz = Character(centerCoordinate:tazCenterCoordinate, radius:tazRadius)
        taz.color = UIColor.orangeColor()
        
        let tweetyFilePath = NSBundle.mainBundle().pathForResource("TweetyBirdLocations", ofType: "plist")
        let tweetyLocations = NSArray(contentsOfFile: tweetyFilePath!)
        let tweetyPoint = CGPointFromString(tweetyLocations![Int(rand()%4)] as! String)
        let tweetyCenterCoordinate = CLLocationCoordinate2DMake(CLLocationDegrees(tweetyPoint.x), CLLocationDegrees(tweetyPoint.y))
        let tweetyRadius = CLLocationDistance(max(5, Int(rand()%40)))
        let tweety = Character(centerCoordinate:tweetyCenterCoordinate, radius:tweetyRadius)
        tweety.color = UIColor.yellowColor()
        
        mapView.addOverlay(batman)
        mapView.addOverlay(taz)
        mapView.addOverlay(tweety)
        
    }
    
    func addAttractionPins() {
        let filePath = NSBundle.mainBundle().pathForResource("MagicMountainAttractions", ofType: "plist")
        let attractions = NSArray(contentsOfFile: filePath!)
        for attraction in attractions! {
            let point = CGPointFromString(attraction["location"] as! String)
            let coordinate = CLLocationCoordinate2DMake(CLLocationDegrees(point.x), CLLocationDegrees(point.y))
            let title = attraction["name"] as! String
            let typeRawValue = Int(attraction["type"] as! String)!
            let type = AttractionType(rawValue: typeRawValue)!
            let subtitle = attraction["subtitle"] as! String
            let annotation = AttractionAnnotation(coordinate: coordinate, title: title, subtitle: subtitle, type: type)
            mapView.addAnnotation(annotation)
        }
    }
    
    
    func addOverlay() {
        let overlay = ParkMapOverlay(park: park)
        mapView.addOverlay(overlay)
    }

    
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let optionsViewController = segue.destinationViewController as! MapOptionsViewController
    optionsViewController.selectedOptions = selectedOptions
  }
  
  
  @IBAction func mapTypeChanged(sender: AnyObject) {
    let mapType = MapType(rawValue: mapTypeSegmentedControl.selectedSegmentIndex)
    switch (mapType!) {
    case .Standard:
        mapView.mapType = MKMapType.Standard
    case .Hybrid:
        mapView.mapType = MKMapType.Hybrid
    case .Satellite:
        mapView.mapType = MKMapType.Satellite
    }
  }
}


extension ParkMapViewController: MKMapViewDelegate {
    
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is ParkMapOverlay {
            let magicMountainImage = UIImage(named: "mapwhite")
            let overlayView = ParkMapOverlayView(overlay: overlay, overlayImage: magicMountainImage!)
            
            return overlayView
        } else if overlay is MKPolyline {
            let lineView = MKPolylineRenderer(overlay: overlay)
            lineView.strokeColor = route!.color
            lineView.lineWidth = 11.0
            
            return lineView
        } else if overlay is MKPolygon {
            let polygonView = MKPolygonRenderer(overlay: overlay)
            polygonView.strokeColor = UIColor.magentaColor()
            
            return polygonView
        }
        return MKOverlayRenderer()
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = AttractionAnnotationView(annotation: annotation, reuseIdentifier: "Attraction")
        annotationView.canShowCallout = true
        return annotationView
    }
    
}


