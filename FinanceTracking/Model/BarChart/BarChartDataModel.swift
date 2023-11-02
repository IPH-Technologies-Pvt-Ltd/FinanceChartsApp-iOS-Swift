//
//  BarChartDataModel.swift
//  FinanceTracking
//
//  Created by IPH Technologies Pvt. Ltd. on 27/10/23.
//

import Foundation
import DGCharts
struct BarChartDataModel {
    var x: Double
    var y: Double

    static func defaultBarChartFirstSetData() -> [BarChartDataModel] {
        var dataList = [BarChartDataModel]()
        dataList.append(BarChartDataModel(x: 21.0, y: 50.0))
        dataList.append(BarChartDataModel(x: 22.0, y: 50.0))
        dataList.append(BarChartDataModel(x: 23.0, y: 125.0))
        dataList.append(BarChartDataModel(x: 24.0, y: 100.0))
        dataList.append(BarChartDataModel(x: 25.0, y: 225.0))
        return dataList
    }
    
    static func defaultBarChartSecondSetData() -> [BarChartDataModel] {
        var dataList2 = [BarChartDataModel]()
        dataList2.append(BarChartDataModel(x: 21.0, y: 25.0))
        dataList2.append(BarChartDataModel(x: 22.0, y: 90.0))
        dataList2.append(BarChartDataModel(x: 23.0, y: 90.0))
        dataList2.append(BarChartDataModel(x: 24.0, y: 150.0))
        dataList2.append(BarChartDataModel(x: 25.0, y: 125.0))
        return dataList2
    }
    
}
