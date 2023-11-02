//
//  LineChartDataModel.swift
//  FinanceTracking
//
//  Created by IPH Technologies Pvt. Ltd. on 26/10/23.
//

import Foundation
import DGCharts
struct LineChartDataModel {
    var x: Double
    var y: Double

    static func defaultLineChartFirstSetData() -> [LineChartDataModel] {
        var dataList = [LineChartDataModel]()
        dataList.append(LineChartDataModel(x: 21.0, y: 50.0))
        dataList.append(LineChartDataModel(x: 22.0, y: 50.0))
        dataList.append(LineChartDataModel(x: 23.0, y: 125.0))
        dataList.append(LineChartDataModel(x: 24.0, y: 100.0))
        dataList.append(LineChartDataModel(x: 25.0, y: 225.0))
        return dataList
    }
    
    static func defaultLineChartSecondSetData() -> [LineChartDataModel] {
        var dataList2 = [LineChartDataModel]()
        dataList2.append(LineChartDataModel(x: 21.0, y: 25.0))
        dataList2.append(LineChartDataModel(x: 22.0, y: 90.0))
        dataList2.append(LineChartDataModel(x: 23.0, y: 90.0))
        dataList2.append(LineChartDataModel(x: 24.0, y: 150.0))
        dataList2.append(LineChartDataModel(x: 25.0, y: 125.0))
        return dataList2
    }
}
