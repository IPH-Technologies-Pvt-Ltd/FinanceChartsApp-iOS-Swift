//
//  ScatterChartDataManager.swift
//  FinanceTracking
//
//  Created by IPH Technologies Pvt. Ltd. on 01/11/23.
//

import Foundation
import DGCharts

struct ScatterChartDataManager {
    
    var dataEntries1: [ChartDataEntry] = []
    var dataEntries2: [ChartDataEntry] = []
    var xArray: [Double] = []
    var counter: Int = 0
    var groupedDataSet : [ScatterChartDataSet] = [ScatterChartDataSet]()
    
    mutating func setData(scatterChartDataArray: [ScatterChartDataModel]) {
        counter += 1
        let count = scatterChartDataArray.count
        print(count)
        for i in 0..<count {
            let x = scatterChartDataArray[i].x
            xArray.append(x)
            let y = scatterChartDataArray[i].y
            let dataEntry = ChartDataEntry(x: x, y: y)
         
            if counter == 1 {
                dataEntries1.append(dataEntry)
            } else {
                dataEntries2.append(dataEntry)
            }
        }
    }
    
    mutating func dataSetUI(dataEntries1: [ChartDataEntry], dataEntries2: [ChartDataEntry]) -> [ScatterChartDataSet]{
        let set1 = ScatterChartDataSet(entries: dataEntries1)
        set1.setColor(UIColor.chartSet1Color())
        let set2 = ScatterChartDataSet(entries: dataEntries2)
        set2.setColor(UIColor.chartSet2Color())        
        return [set1, set2]
    }
}
