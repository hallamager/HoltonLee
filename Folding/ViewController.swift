//
//  ViewController.swift
//  Folding
//
//  Created by Kyle Goslan on 10/05/2016.
//  Copyright © 2016 Kyle Goslan. All rights reserved.
//

import UIKit
import FoldingCell


class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let kCloseCellHeight: CGFloat = 179
    let kOpenCellHeight: CGFloat = 470
    
    var routes = [Route]()
    var routesName: String!
    var route: Route!
    
    var cellHeights = [CGFloat]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        routes.append(Route.init(name: "Sensory Path", duration: "Sensory Path", info: "Take a journey through the estate's varied environments"))
        routes.append(Route.init(name: "Bird Hide Path", duration: "Bird Hide Path", info: "Take a journey through the estate's varied environments"))
        routes.append(Route.init(name: "The Clump Path", duration: "The Clump Path", info: "Take a journey through the estate's varied environments"))
        routes.append(Route.init(name: "Bee Hive Path", duration: "Bee Hive Path", info: "Take a journey through the estate's varied environments"))
        routes.append(Route.init(name: "Heathland path", duration: "Heathland path", info: "Take a journey through the estate's varied environments"))

        
        for _ in 0...routes.count {
            cellHeights.append(kCloseCellHeight)
        }
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return cellHeights[indexPath.row]
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FoldingCell", forIndexPath: indexPath) as! RouteCell
        
        cell.route = routes[indexPath.row]
        cell.setUpCell()
        
        
        return cell
    }
}

extension ViewController: UITabBarDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! RouteCell
        
        var duration = 0.0
        if cellHeights[indexPath.row] == kCloseCellHeight { // open cell
            cellHeights[indexPath.row] = kOpenCellHeight
            cell.selectedAnimation(true, animated: true, completion: nil)
            duration = 0.5
        } else {// close cell
            cellHeights[indexPath.row] = kCloseCellHeight
            cell.selectedAnimation(false, animated: true, completion: nil)
            duration = 1.1
        }
        
        UIView.animateWithDuration(duration, delay: 0, options: .CurveEaseOut, animations: { () -> Void in
            tableView.beginUpdates()
            tableView.endUpdates()
            }, completion: nil)
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if cell is RouteCell {
            let foldingCell = cell as! RouteCell
            
            if cellHeights[indexPath.row] == kCloseCellHeight {
                foldingCell.selectedAnimation(false, animated: false, completion:nil)
            } else {
                foldingCell.selectedAnimation(true, animated: false, completion: nil)
            }
        }
    }
}

