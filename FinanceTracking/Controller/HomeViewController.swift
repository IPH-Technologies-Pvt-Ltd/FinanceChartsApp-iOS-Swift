//
//  ViewController.swift
//  FinanceTracking
//
//  Created by IPH Technologies Pvt. Ltd. on 26/10/23.
//

import UIKit
import DGCharts

class HomeViewController: UIViewController {
    
    @IBOutlet weak var allTimeButton: UIButton!
    @IBOutlet weak var thisYearButton: UIButton!
    @IBOutlet weak var thisWeekButton: UIButton!
    @IBOutlet weak var planningButton: UIButton!
    @IBOutlet weak var statisticsButton: UIButton!
    @IBOutlet weak var earningsButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifiers = ["lineChartCell", "barChartCell", "pieChartCell", "scatterChartCell"]
    var lineChartDataArray = [ChartDataModel]()
    var lineChartDataManager = LineChartDataManager()
    var barChartDataArray = [ChartDataModel]()
    var barChartDataManager = BarChartDataManager()
    var pieChartDataArray = [PieChartDataModel]()
    var pieChartDataManager = PieChartDataManager()
    var scatterChartDataArray = [ChartDataModel]()
    var scatterChartDataManager = ScatterChartDataManager()
    let groupSpace = 0.3
    let barSpace = 0.05
    let barWidth = 0.3
    var lineData: LineChartData?
    var barData: BarChartData?
    var pieBarData: PieChartData?
    var scatterData: ScatterChartData?
    var indexNumber: Int?
    var entries = [ChartDataEntry]()
    var chooseDate = ["21", "22", "23", "24", "25"]
    var dateSelected: String?
    var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupUI()
        //Line Chart
        lineChartDataArray = ChartDataModel.defaultChartFirstSetData()
        lineChartDataManager.setData(lineChartDataArray: lineChartDataArray)
        lineChartDataArray.removeAll()
        lineChartDataManager.xArray.removeAll()
        lineChartDataArray = ChartDataModel.defaultChartSecondSetData()
        lineChartDataManager.setData(lineChartDataArray: lineChartDataArray)
        lineChartDataArray.removeAll()
        //Bar chart
        barChartDataArray = ChartDataModel.defaultChartFirstSetData()
        barChartDataManager.setData(barChartDataArray: barChartDataArray)
        barChartDataArray.removeAll()
        barChartDataManager.xArray.removeAll()
        barChartDataArray = ChartDataModel.defaultChartSecondSetData()
        barChartDataManager.setData(barChartDataArray: barChartDataArray)
        barChartDataArray.removeAll()
        //Pie chart
        pieChartDataArray = PieChartDataModel.defaultPieChartFirstSetData()
        let dataReceivedPie = pieChartDataManager.setData(pieChartDataArray: pieChartDataArray)
        pieChartDataArray.removeAll()
        pieChartDataManager.xArray.removeAll()
        pieChartDataManager.yArray.removeAll()
        for i in 0...1 {
            let x = dataReceivedPie[i].x
            let y = dataReceivedPie[i].y
            let dataEntry = PieChartDataEntry(value: y, data: x)
            pieChartDataManager.dataEntries1.append(dataEntry)
            pieBarData = PieChartData(dataSets: pieChartDataManager.dataSetUI(dataEntries1: pieChartDataManager.dataEntries1))
            self.i += 1
        }
        //Scatter chart
        scatterChartDataArray = ChartDataModel.defaultChartFirstSetData()
        scatterChartDataManager.setData(scatterChartDataArray: scatterChartDataArray)
        scatterChartDataArray.removeAll()
        scatterChartDataManager.xArray.removeAll()
        scatterChartDataArray = ChartDataModel.defaultChartSecondSetData()
        scatterChartDataManager.setData(scatterChartDataArray: scatterChartDataArray)
        scatterChartDataArray.removeAll()
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
    
    func setupUI() {
        allTimeButton.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        thisYearButton.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        thisWeekButton.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        planningButton.contentHorizontalAlignment = .left
        statisticsButton.titleLabel?.font = UIFont.systemFont(ofSize: 26, weight: .regular)
        earningsButton.contentHorizontalAlignment = .right
        allTimeButton.layer.borderWidth = 0.1
        allTimeButton.layer.borderColor = UIColor.gray.cgColor
        thisYearButton.layer.borderWidth = 0.1
        thisYearButton.layer.borderColor = UIColor.gray.cgColor
        thisWeekButton.layer.borderWidth = 0.1
        thisWeekButton.layer.borderColor = UIColor.gray.cgColor
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellIdentifiers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = cellIdentifiers[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        if let lineChartCell = cell as? CustomLineChartTableViewCell {
            // Configure line chart cell
            lineData = LineChartData(dataSets: lineChartDataManager.dataSetUI(dataEntries1: lineChartDataManager.dataEntries1, dataEntries2: lineChartDataManager.dataEntries2))
            lineData?.setDrawValues(false)
            lineChartCell.lineChartView.data = lineData
        }
        if let barChartCell = cell as? CustomBarChartTableViewCell {
            // Configure bar chart cell
            barData = BarChartData(dataSets: barChartDataManager.dataSetUI(dataEntries1: barChartDataManager.dataEntries1, dataEntries2: barChartDataManager.dataEntries2))
            barData?.setDrawValues(false)
            barData?.barWidth = 0.25
            let gg = barData?.groupWidth(groupSpace: groupSpace, barSpace: barSpace)
            barData?.groupBars(fromX: 21, groupSpace: groupSpace, barSpace: barSpace)
            barChartCell.barChartView.data = barData
        }
        if let pieChartCell = cell as? CustomPieChartTableViewCell {
            // Configure thin bar chart cell
            //action of menu options
            let actions: [UIAction] = chooseDate.map {
                let action = UIAction(title: $0) { [self] action in
                    dateSelected = action.title
                    // Pass the selected date to PieChartDataManager
                    pieChartDataManager.handleSelectedDate(selectedDate: dateSelected)
                    pieChartDataArray = PieChartDataModel.defaultPieChartFirstSetData()
                    pieChartDataManager.setData(pieChartDataArray: pieChartDataArray)
                    pieChartDataArray.removeAll()
                    pieChartDataManager.xArray.removeAll()
                    pieChartDataManager.yArray.removeAll()
                    pieBarData = PieChartData(dataSets: pieChartDataManager.dataSetUI(dataEntries1: pieChartDataManager.dataEntries1))
                    pieBarData?.setDrawValues(false)
                    pieChartCell.pieChartView.data = pieBarData
                }
                pieBarData?.setDrawValues(false)
                pieChartCell.pieChartView.data = pieBarData
                return action
            }
            let menu = UIMenu(children: actions)
            pieChartCell.datePullDownButton.menu = menu
        }
        if let scatterChartCell = cell as? CustomScatterChartTableViewCell {
            // Configure pie chart cell
            scatterData = ScatterChartData(dataSets: scatterChartDataManager.dataSetUI(dataEntries1: scatterChartDataManager.dataEntries1, dataEntries2: scatterChartDataManager.dataEntries2))
            scatterData?.setDrawValues(false)
            scatterChartCell.scatterChartView.data = scatterData
        }
        cell.heroID = "heroAnimation"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("you tapped in section \(indexPath.section) at row \(indexPath.row)")
        indexNumber = indexPath.row
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "StatisticsViewController") as! StatisticsViewController
        vc.indexPassed = indexNumber ?? 0
        vc.lineChartDataReceived = lineData
        vc.barChartDataReceived = barData
        vc.pieChartDataReceived = pieBarData
        vc.scatterChartDataReceived = scatterData
        showHero(vc)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 250
    }
}
