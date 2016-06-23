//
//  OneLineViewController.swift
//  MRTStation
//
//  Created by soslab on 2016/5/16.
//  Copyright © 2016年 soslab. All rights reserved.
//

import UIKit

class OneLineViewController: UIViewController {

    @IBOutlet weak var OneLine: UILabel!
    @IBOutlet weak var OneLineStationName: UILabel!
    
    var stationNameGet: String!
    var lineNameGet: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.OneLine.text = lineNameGet
        self.OneLineStationName.text = stationNameGet
        
        self.navigationItem.title = stationNameGet
        self.OneLine.backgroundColor = MRTStationJSON().lineColor(lineNameGet)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
