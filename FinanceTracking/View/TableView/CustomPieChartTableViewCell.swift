//
//  CustomThinBarChartTableViewCell.swift
//  FinanceTracking
//
//  Created by IPH Technologies Pvt. Ltd. on 26/10/23.
//

import UIKit
import DGCharts

class CustomPieChartTableViewCell: UITableViewCell {
   
    @IBOutlet weak var pieChartView: PieChartView!
    @IBOutlet weak var datePullDownButton: UIButton!
    @IBOutlet weak var shadowLayerPieView: UIView!
    
    var lineChartDataManager = LineChartDataManager()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // customize cell
        pieChartView.layer.cornerRadius = 10.0
        pieChartView.clipsToBounds = true
        // Apply rounded corners to contentView
        contentView.layer.cornerRadius = 10.0
        contentView.layer.masksToBounds = true
        // Set masks to bounds to false to avoid the shadow from being clipped to the corner radius
        shadowLayerPieView.layer.cornerRadius = 6.0
        shadowLayerPieView.layer.masksToBounds = false
        // Apply a shadow
        shadowLayerPieView.layer.shadowRadius = 10.0
        shadowLayerPieView.layer.shadowOpacity = 0.2
        shadowLayerPieView.layer.shadowColor = UIColor.lightGray.cgColor
        shadowLayerPieView.layer.shadowOffset = CGSize(width: 0, height: 5)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        pieChartView.legend.enabled = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
}
