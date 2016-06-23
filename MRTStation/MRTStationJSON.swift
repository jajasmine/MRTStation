//
//  MRTStationJSON.swift
//  MRTStation
//
//  Created by soslab on 2016/5/11.
//  Copyright © 2016年 soslab. All rights reserved.


import Foundation
import SwiftyJSON

struct mrtStationElements {
    var lineName: String
    var station: [String: [String]]
    
    init(lineName: String, station: [String: [String]]) {
        self.lineName = lineName
        self.station = station
    }
}

class MRTStationJSON {
    var MRTStationArray = [mrtStationElements]()
    var MRTLineArray = [String]()
    
    func parseJSON() -> [mrtStationElements] {
        
        let path : String = NSBundle.mainBundle().pathForResource("MRT", ofType: "json") as String!
        let jsonData = NSData(contentsOfFile: path) as NSData!
        let readableJSON = JSON(data: jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil)
        
        var wenHuDic = [String: [String]]()
        var banNanDic = [String: [String]]()
        var songShanDic = [String: [String]]()
        var zhongHeDic = [String: [String]]()
        var danShuiDic = [String: [String]]()
        var biTanDic = [String: [String]]()
        var maoKongDic = [String: [String]]()
        var beiTouDic = [String: [String]]()
        
        for i in 0...readableJSON.count {
            
            let stationName = readableJSON[i]["name"].stringValue
            let line = readableJSON[i]["lines"].dictionaryValue.map({ (x: (String, JSON)) -> String in
                return x.0
            })
            
            let lineCode = readableJSON[i]["lines"].dictionaryValue.map({ (x: (String, JSON)) -> String in
                return x.1.stringValue
            })
            
            if line.contains("文湖線") {
                wenHuDic[String(stationName)] = lineCode
            }
            
            if line.contains("板南線") {
                banNanDic[String(stationName)] = lineCode
            }
            
            if line.contains("松山新店線") {
                songShanDic[String(stationName)] = lineCode
            }
            
            if line.contains("中和新蘆線") {
                zhongHeDic[String(stationName)] = lineCode
            }
            
            if line.contains("淡水信義線") {
                danShuiDic[String(stationName)] = lineCode
            }
            
            if line.contains("小碧潭支線") {
                biTanDic[String(stationName)] = lineCode
            }
            
            if line.contains("貓空纜車") {
                maoKongDic[String(stationName)] = lineCode
            }
            
            if line.contains("新北投支線") {
                beiTouDic[String(stationName)] = lineCode
            }
        }
        
        let wenHu = mrtStationElements(lineName: "文湖線", station: wenHuDic)
        let banNan = mrtStationElements(lineName: "板南線", station: banNanDic)
        let songShan = mrtStationElements(lineName: "松山新店線", station: songShanDic)
        let zhongHe = mrtStationElements(lineName: "中和新蘆線", station: zhongHeDic)
        let danShui = mrtStationElements(lineName: "淡水信義線", station: danShuiDic)
        let biTan = mrtStationElements(lineName: "小碧潭支線", station: biTanDic)
        let maoKong = mrtStationElements(lineName: "貓空纜車", station: maoKongDic)
        let beiTou = mrtStationElements(lineName: "新北投支線", station: beiTouDic)
        
        MRTStationArray.append(wenHu)
        MRTStationArray.append(banNan)
        MRTStationArray.append(songShan)
        MRTStationArray.append(zhongHe)
        MRTStationArray.append(danShui)
        MRTStationArray.append(biTan)
        MRTStationArray.append(maoKong)
        MRTStationArray.append(beiTou)
        
        return MRTStationArray
    }
    
    func StationList(StationName: String) -> [String] {
        
        let path : String = NSBundle.mainBundle().pathForResource("MRT", ofType: "json") as String!
        let jsonData = NSData(contentsOfFile: path) as NSData!
        let readableJSON = JSON(data: jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil)
        
        var wenHuList = [String]()
        var banNanList = [String]()
        var songShanList = [String]()
        var zhongHeList = [String]()
        var danShuiList = [String]()
        var biTanList = [String]()
        var maoKongList = [String]()
        var beiTouList = [String]()
        
        for i in 0...readableJSON.count {
            
            let stationName = readableJSON[i]["name"].stringValue
            
            if stationName.containsString("文湖線") {
                wenHuList.append(stationName)
            }
            if stationName.containsString("板南線") {
                banNanList.append(stationName)
            }
            if stationName.containsString("松山新店線") {
                songShanList.append(stationName)
            }
            if stationName.containsString("中和新蘆線") {
                zhongHeList.append(stationName)
            }
            if stationName.containsString("淡水信義線") {
                danShuiList.append(stationName)
            }
            if stationName.containsString("小碧潭支線") {
                biTanList.append(stationName)
            }
            if stationName.containsString("貓空纜車") {
                maoKongList.append(stationName)
            }
            if stationName.containsString("新北投支線") {
                beiTouList.append(stationName)
            }
        }
        
        if wenHuList.contains(StationName) {
            MRTLineArray.append("文湖線")
        }
        if banNanList.contains(StationName) {
            MRTLineArray.append("板南線")
        }
        if songShanList.contains(StationName) {
            MRTLineArray.append("松山新店線")
        }
        if zhongHeList.contains(StationName) {
            MRTLineArray.append("中和新蘆線")
        }
        if danShuiList.contains(StationName) {
            MRTLineArray.append("淡水信義線")
        }
        if biTanList.contains(StationName) {
            MRTLineArray.append("小碧潭線")
        }
        if maoKongList.contains(StationName) {
            MRTLineArray.append("貓空纜車")
        }
        if beiTouList.contains(StationName) {
            MRTLineArray.append("新北投線")
        }
        
        return MRTLineArray
    }
    
    func codeColor(lineCode: String) -> UIColor {
        
        if lineCode.containsString("BR") {
            return UIColor(red: 158/255, green: 101/255, blue: 46/255, alpha: 1)
        } else if lineCode.containsString("BL") {
            return UIColor(red: 0/255, green: 94/255, blue: 184/255, alpha: 1)
        } else if lineCode.containsString("G") && !lineCode.containsString("M") && !lineCode.containsString("A") {
            return UIColor(red: 0/255, green: 119/255, blue: 73/255, alpha: 1)
        } else if lineCode.containsString("O") {
            return UIColor(red: 255/255, green: 163/255, blue: 0/255, alpha: 1)
        } else if lineCode.containsString("R") && !lineCode.containsString("A") {
            return UIColor(red: 203/255, green: 44/255, blue: 48/255, alpha: 1)
        } else if lineCode.containsString("G03A") {
            return UIColor(red: 206/255, green: 220/255, blue: 0/255, alpha: 1)
        } else if lineCode.containsString("MG") {
            return UIColor(red: 119/255, green: 185/255, blue: 51/255, alpha: 1)
        } else {
            return UIColor(red: 248/255, green: 144/255, blue: 165/255, alpha: 1)
        }
    }
    
    func lineColor(lineName: String) -> UIColor {
        
        if lineName.containsString("文湖線") {
            return UIColor(red: 158/255, green: 101/255, blue: 46/255, alpha: 1)
        } else if lineName.containsString("板南線") {
            return UIColor(red: 0/255, green: 94/255, blue: 184/255, alpha: 1)
        } else if lineName.containsString("松山新店線") {
            return UIColor(red: 0/255, green: 119/255, blue: 73/255, alpha: 1)
        } else if lineName.containsString("中和新蘆線") {
            return UIColor(red: 255/255, green: 163/255, blue: 0/255, alpha: 1)
        } else if lineName.containsString("淡水信義線") {
            return UIColor(red: 203/255, green: 44/255, blue: 48/255, alpha: 1)
        } else if lineName.containsString("小碧潭支線") {
            return UIColor(red: 206/255, green: 220/255, blue: 0/255, alpha: 1)
        } else if lineName.containsString("貓空纜車") {
            return UIColor(red: 119/255, green: 185/255, blue: 51/255, alpha: 1)
        } else {
            return UIColor(red: 248/255, green: 144/255, blue: 165/255, alpha: 1)
        }
    }
}