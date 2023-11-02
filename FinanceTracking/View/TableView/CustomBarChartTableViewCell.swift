//
//  CustomBarChartTableViewCell.swift
//  FinanceTracking
//
//  Created by IPH Technologies Pvt. Ltd. on 26/10/23.
//

import UIKit
import DGCharts

class CustomBarChartTableViewCell: UITableViewCell {

    @IBOutlet weak var barChartView: BarChartView!
    @IBOutlet weak var shadowLayerBarView: UIView!
    
    var lineChartDataManager = LineChartDataManager()
    override func awakeFromNib() {
        super.awakeFromNib()
        // customize cell
        barChartView.layer.cornerRadius = 10.0
        barChartView.clipsToBounds = true
        // Apply rounded corners to contentView
        contentView.layer.cornerRadius = 10.0
        contentView.layer.masksToBounds = true
        // Set masks to bounds to false to avoid the shadow from being clipped to the corner radius
        shadowLayerBarView.layer.cornerRadius = 6.0
        shadowLayerBarView.layer.masksToBounds = false
        // Apply a shadow
        shadowLayerBarView.layer.shadowRadius = 10.0
        shadowLayerBarView.layer.shadowOpacity = 0.2
        shadowLayerBarView.layer.shadowColor = UIColor.lightGray.cgColor
        shadowLayerBarView.layer.shadowOffset = CGSize(width: 0, height: 5)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        barChartView.rightAxis.enabled = false
        barChartView.xAxis.labelPosition = .bottom
        barChartView.legend.enabled = false
        let yAxis = barChartView.leftAxis
        let xAxis = barChartView.xAxis
        yAxis.gridColor = UIColor.chartGridLineColor()
        yAxis.labelFont = .boldSystemFont(ofSize: 10)
        yAxis.setLabelCount(5, force: false)
        yAxis.axisLineColor = UIColor.chartGridLineColor()
        yAxis.labelPosition = .insideChart
        yAxis.axisLineColor = .clear
        xAxis.drawGridLinesEnabled = false
        xAxis.setLabelCount(5, force: false)
        xAxis.gridColor = UIColor.chartGridLineColor()
        xAxis.axisLineColor = UIColor.chartGridLineColor()
        xAxis.valueFormatter = ChartXAxisFormatter(xArray: lineChartDataManager.xArray)
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
}
