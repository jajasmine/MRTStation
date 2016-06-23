//
//  MRTListViewController.swift
//  MRTStation
//
//  Created by soslab on 2016/5/10.
//  Copyright © 2016年 soslab. All rights reserved.
//

import UIKit

class MRTListViewController: UITableViewController {
    
    @IBOutlet var MRTList: UITableView!
    
    var MRTStationList = [mrtStationElements]()
    var MRTLineTitle = [String]()
    var stationName = [String]()
    var lineCode = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        MRTStationList = MRTStationJSON().parseJSON()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return MRTStationList.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MRTStationList[section].station.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return MRTStationList[section].lineName
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! MRTListViewCell
        let stationDic = MRTStationList[indexPath.section].station
        
        stationName = stationDic.map {(x: (String, [String])) -> String in
            return x.0
        }
        
        lineCode = stationDic.map {(x: (String, [String])) -> [String] in
            return x.1
        }
        
        let stationLineNum = lineCode[indexPath.row].count
        cell.MRTStationName.text = stationName[indexPath.row]
        
        if stationLineNum == 2 {
            cell.LineCode2.text = lineCode[indexPath.row][0]
            cell.LineCode2.backgroundColor = MRTStationJSON().codeColor(lineCode[indexPath.row][0])
            cell.LineCode2.layer.cornerRadius = 10
            
            cell.LineCode1.text = lineCode[indexPath.row][1]
            cell.LineCode1.backgroundColor = MRTStationJSON().codeColor(lineCode[indexPath.row][1])
            cell.LineCode1.layer.cornerRadius = 10
        } else {
            cell.LineCode2.text = lineCode[indexPath.row][0]
            cell.LineCode2.backgroundColor = MRTStationJSON().codeColor(lineCode[indexPath.row][0])
            cell.LineCode2.layer.cornerRadius = 10
            
            cell.LineCode1.hidden = true
        }
        
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let numOfStationLine = lineCode[indexPath.row].count
        
        if numOfStationLine == 1 {
            self.performSegueWithIdentifier("OneLine", sender: self)
        } else {
            self.performSegueWithIdentifier("TwoLines", sender: self)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let index = tableView.indexPathForSelectedRow
        let cell = tableView.cellForRowAtIndexPath(index!) as! MRTListViewCell

        if segue.identifier == "OneLine" {
            var bigStationName = segue.destinationViewController as! OneLineViewController
            let lineArray = MRTStationJSON().StationList(cell.MRTStationName.text!)
            
            bigStationName.stationNameGet = cell.MRTStationName.text!
            bigStationName.lineNameGet = lineArray[0]

            } else if segue.identifier == "TwoLines" {
            var bigStationName = segue.destinationViewController as! TwoLinesViewController
            let lineArray = MRTStationJSON().StationList(cell.MRTStationName.text!)
            
            bigStationName.stationNameGet = cell.MRTStationName.text!
            bigStationName.lineNameGet1 = lineArray[0]
            bigStationName.lineNameGet2 = lineArray[1]
        }
    }
}
