//
//  CustomTableViewCell.swift
//  FinanceTracking
//
//  Created by IPH Technologies Pvt. Ltd. on 26/10/23.
//

import UIKit
import DGCharts

class CustomLineChartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var shadowLayerView: UIView!
    
    var lineChartDataManager = LineChartDataManager()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // customize cell
        lineChartView.layer.cornerRadius = 10.0
        lineChartView.clipsToBounds = true
        // Apply rounded corners to contentView
        contentView.layer.cornerRadius = 10.0
        contentView.layer.masksToBounds = true
        // Set masks to bounds to false to avoid the shadow from being clipped to the corner radius
        shadowLayerView.layer.cornerRadius = 6.0
        shadowLayerView.layer.masksToBounds = false
        // Apply a shadow
        shadowLayerView.layer.shadowRadius = 10.0
        shadowLayerView.layer.shadowOpacity = 0.2
        shadowLayerView.layer.shadowColor = UIColor.lightGray.cgColor
        shadowLayerView.layer.shadowOffset = CGSize(width: 0, height: 5)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // customize line chart
        lineChartView.rightAxis.enabled = false
        lineChartView.xAxis.labelPosition = .bottom
        lineChartView.legend.enabled = false
        let yAxis = lineChartView.leftAxis
        let xAxis = lineChartView.xAxis
        yAxis.gridColor = UIColor.chartGridLineColor()
        yAxis.labelFont = .boldSystemFont(ofSize: 10)
        yAxis.setLabelCount(5, force: false)
        yAxis.axisLineColor = UIColor.chartGridLineColor()
        xAxis.setLabelCount(5, force: false)
        xAxis.gridColor = UIColor.chartGridLineColor()
        xAxis.axisLineColor = UIColor.chartGridLineColor()
        xAxis.valueFormatter = ChartXAxisFormatter(xArray: lineChartDataManager.xArray)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //for adding space between cells of tableview
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
}
