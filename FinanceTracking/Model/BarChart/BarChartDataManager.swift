//
//  BarChartDataManager.swift
//  FinanceTracking
//
//  Created by IPH Technologies Pvt. Ltd. on 27/10/23.
//

import Foundation
import DGCharts

struct BarChartDataManager {
    
    var dataEntries1: [BarChartDataEntry] = []
    var dataEntries2: [BarChartDataEntry] = []
    var xArray: [Double] = []
    var counter: Int = 0
    var groupedDataSet : [BarChartDataSet] = [BarChartDataSet]()
    
    mutating func setData(barChartDataArray: [BarChartDataModel]) {
        counter += 1
        let count = barChartDataArray.count
        print(count)
        for i in 0..<count {
            let x = barChartDataArray[i].x
            xArray.append(x)
            let y = barChartDataArray[i].y
            let dataEntry = BarChartDataEntry(x: x, y: y)
            if counter == 1 {
                dataEntries1.append(dataEntry)
            } else {
                dataEntries2.append(dataEntry)
            }
        }
    }
    
    mutating func dataSetUI(dataEntries1: [BarChartDataEntry], dataEntries2: [BarChartDataEntry]) -> [BarChartDataSet]{
        let set1 = BarChartDataSet(entries: dataEntries1)
        set1.setColor(UIColor.chartSet1Color())
        let set2 = BarChartDataSet(entries: dataEntries2)
        set2.setColor(UIColor.chartSet2Color())
        return [set1, set2]
    }
}
