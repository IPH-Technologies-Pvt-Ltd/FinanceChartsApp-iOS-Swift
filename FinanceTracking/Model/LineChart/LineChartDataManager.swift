//
//  LineChartDataManager.swift
//  FinanceTracking
//
//  Created by IPH Technologies Pvt. Ltd. on 26/10/23.
//

import Foundation
import DGCharts

struct LineChartDataManager {
    
    var dataEntries1: [ChartDataEntry] = []
    var dataEntries2: [ChartDataEntry] = []
    var xArray: [Double] = []
    var counter: Int = 0

    mutating func setData(lineChartDataArray: [LineChartDataModel]) {
        counter += 1
        let count = lineChartDataArray.count
        print(count)
        for i in 0..<count {
            let x = lineChartDataArray[i].x
            xArray.append(x)
            let y = lineChartDataArray[i].y
            let dataEntry = ChartDataEntry(x: x, y: y)
            if counter == 1 {
                dataEntries1.append(dataEntry)
            } else {
                dataEntries2.append(dataEntry)
            }
        }
    }
    
    func dataSetUI(dataEntries1: [ChartDataEntry], dataEntries2: [ChartDataEntry]) -> [LineChartDataSet]{
        let set1 = LineChartDataSet(entries: dataEntries1)
        set1.mode = .cubicBezier
        set1.lineWidth = 2
        set1.setColor(UIColor.chartSet1Color())
        set1.setCircleColor(UIColor.chartSet1Color())
        set1.circleRadius = 5
        set1.fillAlpha = 15/255
        set1.fillColor = UIColor.chartSet1Color()
        set1.drawFilledEnabled = true
        let set2 = LineChartDataSet(entries: dataEntries2)
        set2.mode = .cubicBezier
        set2.lineWidth = 2
        set2.setColor(UIColor.chartSet2Color())
        set2.setCircleColor(UIColor.chartSet2Color())
        set2.circleRadius = 5
        set2.fillAlpha = 10/255
        set2.fillColor = UIColor.chartSet2Color()
        set2.drawFilledEnabled = true
        return [set1, set2]
    }
}
