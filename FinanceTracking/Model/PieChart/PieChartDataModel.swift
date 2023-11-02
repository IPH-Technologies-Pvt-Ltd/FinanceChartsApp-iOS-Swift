//
//  SinusBarChart.swift
//  FinanceTracking
//
//  Created by IPH Technologies Pvt. Ltd. on 31/10/23.
//

import Foundation
import DGCharts
struct PieChartDataModel {
    var x: Double
    var y: Double

    static func defaultPieChartFirstSetData() -> [PieChartDataModel] {
        var dataList = [PieChartDataModel]()
        dataList.append(PieChartDataModel(x: 21.0, y: 50))
        dataList.append(PieChartDataModel(x: 21.0, y: 25))
        dataList.append(PieChartDataModel(x: 22.0, y: 60))
        dataList.append(PieChartDataModel(x: 22.0, y: 90))
        dataList.append(PieChartDataModel(x: 23.0, y: 125))
        dataList.append(PieChartDataModel(x: 23.0, y: 100))
        dataList.append(PieChartDataModel(x: 24.0, y: 100))
        dataList.append(PieChartDataModel(x: 24.0, y: 150))
        dataList.append(PieChartDataModel(x: 25.0, y: 225))
        dataList.append(PieChartDataModel(x: 25.0, y: 125))
        return dataList
    }
}
