//
//  SinusBarChartDataManager.swift
//  FinanceTracking
//
//  Created by IPH Technologies Pvt. Ltd. on 31/10/23.
//

import Foundation
import DGCharts

struct PieChartDataManager {
    
    var dataEntries1: [PieChartDataEntry] = []
    var dataEntries2: [PieChartDataEntry] = []
    var xArray: [Double] = []
    var yArray: [Double] = []
    var counter: Int = 0
    var date: String?
    
    mutating func handleSelectedDate(selectedDate: String?) {
        date = selectedDate
        print("Selected date is: \(String(describing: date))")
    }
    
    mutating func setData(pieChartDataArray: [PieChartDataModel]) -> [PieChartDataModel] {
        let count = pieChartDataArray.count
        print(count)
        dataEntries1.removeAll()
        for i in 0..<count {
            if date == String(Int(pieChartDataArray[i].x)) {
                let x = pieChartDataArray[i].x
                let y = pieChartDataArray[i].y
                xArray.append(x)
                yArray.append(y)
                let dataEntry = PieChartDataEntry(value: y, data: x)
               dataEntries1.append(dataEntry)
            }
        }
        print("xArray.countxArray.count\(xArray.count)")
        return pieChartDataArray
    }
    
    func dataSetUI(dataEntries1: [PieChartDataEntry]) -> [PieChartDataSet]{
        let set1 = PieChartDataSet(entries: dataEntries1)
        set1.colors = [UIColor.chartSet1Color()] + [UIColor.chartSet2Color()]
        return [set1]
    }
}
