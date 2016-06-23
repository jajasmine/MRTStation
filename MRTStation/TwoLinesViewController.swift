//
//  TwoLinesViewController.swift
//  MRTStation
//
//  Created by soslab on 2016/5/16.
//  Copyright © 2016年 soslab. All rights reserved.
//

import UIKit

class TwoLinesViewController: UIViewController {

    @IBOutlet weak var TwoLines2: UILabel!
    @IBOutlet weak var TwoLines1: UILabel!
    @IBOutlet weak var TwoLinesStationName: UILabel!
    
    var stationNameGet: String!
    var lineNameGet1: String!
    var lineNameGet2: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.TwoLines1.text = lineNameGet1
        self.TwoLines2.text = lineNameGet2
        self.TwoLinesStationName.text = stationNameGet
        
        self.navigationItem.title = stationNameGet
        self.TwoLines1.backgroundColor = MRTStationJSON().lineColor(lineNameGet1)
        self.TwoLines2.backgroundColor = MRTStationJSON().lineColor(lineNameGet2)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
