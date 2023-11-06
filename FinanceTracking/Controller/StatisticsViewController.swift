//
//  StatisticsViewController.swift
//  FinanceTracking
//
//  Created by IPH Technologies Pvt. Ltd. on 30/10/23.
//

import UIKit
import DGCharts
import Hero

class StatisticsViewController: UIViewController {
    
    @IBOutlet weak var statisticsCollectionView: UICollectionView!
    @IBOutlet weak var dateBackgroundView: UIView!
    @IBOutlet weak var billableDetailsView: UIView!
    @IBOutlet weak var nonBillableDetailsView: UIView!
    
    let vc = HomeViewController()
    var indexPassed: Int = 0
    var lineChartDataManager = LineChartDataManager()
    var lineChartDataReceived: LineChartData?
    var barChartDataReceived: BarChartData?
    var pieChartDataReceived: PieChartData?
    var scatterChartDataReceived: ScatterChartData?
    //craeting chartView to hold the different charts
    lazy var lineChartView: LineChartView = {
        let chartView = LineChartView()
        return chartView
    }()
    lazy var barChartView: BarChartView = {
        let barchartView = BarChartView()
        return barchartView
    }()
    lazy var pieChartView: PieChartView = {
        let pieChartView = PieChartView()
        return pieChartView
    }()
    lazy var scatterChartView: ScatterChartView = {
        let scatterChartView = ScatterChartView()
        return scatterChartView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statisticsCollectionView.delegate = self
        statisticsCollectionView.dataSource = self
        statisticsCollectionView.reloadData()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //for transition animation
        enableHero()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //for transition animation
        disableHero()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //for transition animation
        self.billableDetailsView.alpha = 1
        self.nonBillableDetailsView.alpha = 1
        self.dateBackgroundView.alpha = 1
        animate(view: dateBackgroundView, startPosition: 0, endPosition: 110, duration: 1.5)
        animate(view: billableDetailsView, startPosition: -300, endPosition: 200, duration: 1.5)
        animate(view: nonBillableDetailsView, startPosition: -300, endPosition: 200, duration: 1.5)
    }
    
    func setupUI() {
        self.billableDetailsView.alpha = 0
        self.nonBillableDetailsView.alpha = 0
        self.dateBackgroundView.alpha = 0
        dateBackgroundView.layer.masksToBounds = false
        dateBackgroundView.layer.shadowColor = UIColor.black.cgColor
        dateBackgroundView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        dateBackgroundView.layer.shadowOpacity = 0.2
        dateBackgroundView.layer.shadowRadius = 4.0
        billableDetailsView.layer.masksToBounds = false
        billableDetailsView.layer.shadowColor = UIColor.black.cgColor
        billableDetailsView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        billableDetailsView.layer.shadowOpacity = 0.2
        billableDetailsView.layer.shadowRadius = 4.0
        nonBillableDetailsView.layer.masksToBounds = false
        nonBillableDetailsView.layer.shadowColor = UIColor.black.cgColor
        nonBillableDetailsView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        nonBillableDetailsView.layer.shadowOpacity = 0.2
        nonBillableDetailsView.layer.shadowRadius = 4.0
    }
    
    func animate(view: UIView, startPosition: CFloat, endPosition: CFloat, duration: CFTimeInterval ) {
        self.billableDetailsView.isHidden = false
        let animation = CABasicAnimation()
        animation.keyPath = "position.x"
        animation.fromValue = startPosition
        animation.toValue = endPosition
        animation.duration = duration
        view.layer.add(animation, forKey: "basic")
    }
}

extension StatisticsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vc.cellIdentifiers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
        //remove previous subview to avoid duplication of data while reusing cells.
        for subview in cell.demoView.subviews {
            subview.removeFromSuperview()
        }
        if indexPath.row + indexPassed == 0 || indexPassed+indexPath.row-4 == 0 {
            cell.demoView.addSubview(lineChartView)
            lineChartView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                lineChartView.topAnchor.constraint(equalTo: cell.demoView.topAnchor),
                lineChartView.leadingAnchor.constraint(equalTo: cell.demoView.leadingAnchor),
                lineChartView.trailingAnchor.constraint(equalTo: cell.demoView.trailingAnchor),
                lineChartView.bottomAnchor.constraint(equalTo: cell.demoView.bottomAnchor)
            ])
            lineChartView.data = lineChartDataReceived
            //customize line chart
            lineChartView.rightAxis.enabled = false
            lineChartView.xAxis.labelPosition = .bottom
            lineChartView.legend.enabled = false
            lineChartView.animate(xAxisDuration: 2, yAxisDuration: 2)
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
        if indexPath.row + indexPassed == 1 || (indexPassed+indexPath.row-4 == 1) {
            cell.demoView.addSubview(barChartView)
            barChartView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                barChartView.topAnchor.constraint(equalTo: cell.demoView.topAnchor),
                barChartView.leadingAnchor.constraint(equalTo: cell.demoView.leadingAnchor),
                barChartView.trailingAnchor.constraint(equalTo: cell.demoView.trailingAnchor),
                barChartView.bottomAnchor.constraint(equalTo: cell.demoView.bottomAnchor)
            ])
            barChartView.data = barChartDataReceived
            //customize bar chart
            barChartView.rightAxis.enabled = false
            barChartView.xAxis.labelPosition = .bottom
            barChartView.legend.enabled = false
            barChartView.animate(xAxisDuration: 2, yAxisDuration: 2)
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
        }
        if indexPath.row + indexPassed == 2 || indexPassed+indexPath.row-4 == 2 {
            cell.demoView.addSubview(pieChartView)
            pieChartView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                pieChartView.topAnchor.constraint(equalTo: cell.demoView.topAnchor),
                pieChartView.leadingAnchor.constraint(equalTo: cell.demoView.leadingAnchor),
                pieChartView.trailingAnchor.constraint(equalTo: cell.demoView.trailingAnchor),
                pieChartView.bottomAnchor.constraint(equalTo: cell.demoView.bottomAnchor)
            ])
            pieChartView.data = pieChartDataReceived
            //custom pie chart
            pieChartView.legend.enabled = false
            pieChartView.animate(xAxisDuration: 2, yAxisDuration: 2)
        }
        if indexPath.row + indexPassed == 3 || indexPassed+indexPath.row-4 == 3 {
            cell.demoView.addSubview(scatterChartView)
            scatterChartView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                scatterChartView.topAnchor.constraint(equalTo: cell.demoView.topAnchor),
                scatterChartView.leadingAnchor.constraint(equalTo: cell.demoView.leadingAnchor),
                scatterChartView.trailingAnchor.constraint(equalTo: cell.demoView.trailingAnchor),
                scatterChartView.bottomAnchor.constraint(equalTo: cell.demoView.bottomAnchor)
            ])
            scatterChartView.data = scatterChartDataReceived
            scatterChartView.animate(xAxisDuration: 2, yAxisDuration: 2)
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
        cell.heroID = "heroAnimation"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tapped me")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 393, height: 258)
    }
}
