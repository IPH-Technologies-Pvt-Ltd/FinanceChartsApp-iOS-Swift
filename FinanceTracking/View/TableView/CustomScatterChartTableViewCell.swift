//
//  CustomPieChartTableViewCell.swift
//  FinanceTracking
//
//  Created by IPH Technologies Pvt. Ltd. on 26/10/23.
//

import UIKit
import DGCharts

class CustomScatterChartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var scatterChartView: ScatterChartView!
    @IBOutlet weak var shadowLayerScatterView: UIView!
    
    var lineChartDataManager = LineChartDataManager()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // customize cell
        scatterChartView.layer.cornerRadius = 10.0
        scatterChartView.clipsToBounds = true
        // Apply rounded corners to contentView
        contentView.layer.cornerRadius = 10.0
        contentView.layer.masksToBounds = true
        // Set masks to bounds to false to avoid the shadow from being clipped to the corner radius
        shadowLayerScatterView.layer.cornerRadius = 6.0
        shadowLayerScatterView.layer.masksToBounds = false
        // Apply a shadow
        shadowLayerScatterView.layer.shadowRadius = 10.0
        shadowLayerScatterView.layer.shadowOpacity = 0.2
        shadowLayerScatterView.layer.shadowColor = UIColor.lightGray.cgColor
        shadowLayerScatterView.layer.shadowOffset = CGSize(width: 0, height: 5)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        scatterChartView.rightAxis.enabled = false
        scatterChartView.xAxis.labelPosition = .bottom
        scatterChartView.legend.enabled = false
        let yAxis = scatterChartView.leftAxis
        let xAxis = scatterChartView.xAxis
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
