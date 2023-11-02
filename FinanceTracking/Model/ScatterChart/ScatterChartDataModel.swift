//
//  ScatterChartDataModel.swift
//  FinanceTracking
//
//  Created by IPH Technologies Pvt. Ltd. on 01/11/23.
//

import Foundation
import DGCharts
struct ScatterChartDataModel {
    var x: Double
    var y: Double

    static func defaultScatterChartFirstSetData() -> [ScatterChartDataModel] {
        var dataList = [ScatterChartDataModel]()
        dataList.append(ScatterChartDataModel(x: 21.0, y: 50.0))
        dataList.append(ScatterChartDataModel(x: 22.0, y: 50.0))
        dataList.append(ScatterChartDataModel(x: 23.0, y: 125.0))
        dataList.append(ScatterChartDataModel(x: 24.0, y: 100.0))
        dataList.append(ScatterChartDataModel(x: 25.0, y: 225.0))
        return dataList
    }
    
    static func defaultScatterChartSecondSetData() -> [ScatterChartDataModel] {
        var dataList2 = [ScatterChartDataModel]()
        dataList2.append(ScatterChartDataModel(x: 21.0, y: 25.0))
        dataList2.append(ScatterChartDataModel(x: 22.0, y: 90.0))
        dataList2.append(ScatterChartDataModel(x: 23.0, y: 90.0))
        dataList2.append(ScatterChartDataModel(x: 24.0, y: 150.0))
        dataList2.append(ScatterChartDataModel(x: 25.0, y: 125.0))
        return dataList2
    }
}
