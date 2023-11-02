//
//  ChartXAxisValueFormatter.swift
//  FinanceTracking
//
//  Created by IPH Technologies Pvt. Ltd. on 27/10/23.
//

import Foundation
import DGCharts

class ChartXAxisFormatter: AxisValueFormatter, ChartViewDelegate {

    var xAxisLabel = " "
    var xArray: [Double]
    var i = 0
    
    init(xArray: [Double]) {
        self.xArray = xArray
    }
    //used for formatting the x-axis label
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        print("count == \(xArray.count)")
        print("value === \(value)")
        let castValueToInt = Int(value)
        print(castValueToInt)
        xAxisLabel = "July \(castValueToInt) "
        return xAxisLabel
    }
}
