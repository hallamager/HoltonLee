import UIKit
import MapKit
import CoreLocation



class ParkMapViewController: UIViewController {
    
    var park = Park(filename: "HoltonLeeOverlay")
    
    var route: Route?
    
    var color: UIColor!
    
    let locationManager = CLLocationManager()
    
    var locationsArray = [MyLocation]()
    
    var visitedArray = [String]()

    
    @IBOutlet weak var mapView: MKMapView!
  
    @IBOutlet weak var mapTypeSegmentedControl: UISegmentedControl!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        let latDelta = park.overlayTopLeftCoordinate.latitude -
            park.overlayBottomRightCoordinate.latitude
        
        let span = MKCoordinateSpanMake(fabs(latDelta), 0.0)
        
        let region = MKCoordinateRegionMake(park.midCoordinate, span)
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
        mapView.region = region
        addOverlay()
        addAttractionPins()

        
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

    
    func addAttractionPins() {
        let filePath = NSBundle.mainBundle().pathForResource("MagicMountainAttractions", ofType: "plist")
        let attractions = NSArray(contentsOfFile: filePath!)
        for attraction in attractions! {
            let point = CGPointFromString(attraction["location"] as! String)
            let coordinate = CLLocationCoordinate2DMake(CLLocationDegrees(point.x), CLLocationDegrees(point.y))
            let title = attraction["name"] as! String
            let typeRawValue = Int(attraction["type"] as! String)!
            let type = PointOfInterest(rawValue: typeRawValue)!
            let subtitle = attraction["subtitle"] as! String
            let annotation = MapAnnotation(coordinate: coordinate, title: title, subtitle: subtitle, type: type)
            mapView.addAnnotation(annotation)
            
        }
    }
    
    
    func addOverlay() {
        let overlay = ParkMapOverlay(park: park)
        mapView.addOverlay(overlay)
    }

}


extension ParkMapViewController: MKMapViewDelegate {
    
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is ParkMapOverlay {
            let magicMountainImage = UIImage(named: "maptree")
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
        let annotationView = MapAnnotationView(annotation: annotation, reuseIdentifier: "Attraction")
        annotationView.canShowCallout = true
        return annotationView
    }
    
}

extension ParkMapViewController: CLLocationManagerDelegate {
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let newLocation = locations.last
        
        if let newLocation = newLocation {
            print(newLocation)
        }
        
    }
    
}


//extension ViewController: CLLocationManagerDelegate {
//    
//    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        
//        let newLocation = locations.last
//        
//        if let newLocation = newLocation {
//            //Locations array stores distance from set coordinates.
//            for location in locationsArray {
//                location.distance = newLocation.distanceFromLocation(CLLocation(latitude: location.coord.latitude, longitude: location.coord.longitude))
//            }
//            
//            
//            //Loactions array sorted so the closest region is first in array.
//            locationsArray.sortInPlace { return $0.distance < $1.distance }
//            
//            //Prints name of closest array.
//            print(locationsArray.first!.identifier)
//            //print(locationsArray.first!.distance)
//            
//
//        
//    }
//    
//    
//    
//    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
//        
//        //Adds identifier to Visited array (Won't add location again if region has already been visited).
//        if !visitedArray.contains(region.identifier) {
//            visitedArray.append(region.identifier)
//        }
//        
//        for location in locationsArray {
//            if location.regionDistance > 51 {
//                location.isFound = false
//            }
//        }
//        
//        
//        
//        //first geocache opens with 2sec fade in animation.
//        if  region.identifier == "Seafront" {
//            
//
//                
//            }
//        
//        
//            
//            
//        }
//        
//        //Can only see geocache if user has been to Seafront region first
//        if  region.identifier == "Oceanarium"  {
//            
//
//                
//            }
//        
//            
//            
//            
//        }
//        
//        //Can only see Boscombe image if user has been to Oceanarium
//        
//        if  region.identifier == "Boscombe"  {
//            
//
//            }
//            
//    
//            
//        }
//        
//        //Can only See final image if user has been to Boscombe.
//        
//        if  region.identifier == "Final"  {
//            
//
//
//            }




