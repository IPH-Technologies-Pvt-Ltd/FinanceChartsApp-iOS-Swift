//
//  LineChartDataModel.swift
//  FinanceTracking
//
//  Created by IPH Technologies Pvt. Ltd. on 26/10/23.
//

import Foundation
import DGCharts
struct ChartDataModel {
    var x: Double
    var y: Double

    static func defaultChartFirstSetData() -> [ChartDataModel] {
        var dataList = [ChartDataModel]()
        dataList.append(ChartDataModel(x: 21.0, y: 50.0))
        dataList.append(ChartDataModel(x: 22.0, y: 50.0))
        dataList.append(ChartDataModel(x: 23.0, y: 125.0))
        dataList.append(ChartDataModel(x: 24.0, y: 100.0))
        dataList.append(ChartDataModel(x: 25.0, y: 225.0))
        return dataList
    }
    
    static func defaultChartSecondSetData() -> [ChartDataModel] {
        var dataList2 = [ChartDataModel]()
        dataList2.append(ChartDataModel(x: 21.0, y: 25.0))
        dataList2.append(ChartDataModel(x: 22.0, y: 90.0))
        dataList2.append(ChartDataModel(x: 23.0, y: 90.0))
        dataList2.append(ChartDataModel(x: 24.0, y: 150.0))
        dataList2.append(ChartDataModel(x: 25.0, y: 125.0))
        return dataList2
    }
}
