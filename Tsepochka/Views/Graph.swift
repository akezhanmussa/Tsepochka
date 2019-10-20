//
//  Graph.swift
//  GraphTest
//
//  Created by talgat on 23.12.17.
//  Copyright © 2017 Akezhan. All rights reserved.
//

import UIKit
import Charts
import Firebase
import EasyPeasy
import Alamofire
import Kingfisher


class Charts: UIView, ChartViewDelegate, IAxisValueFormatter  {
    
    private lazy var lineChartView = LineChartView()
    private lazy var allTimeLineChartView = LineChartView()
    

    public var coinName: String? {
        didSet {
            changeTimeRange("1day")
            coinNameShortLabel.text = coinName
        }
    }

    public var coinImageUrl: String?{
        didSet{
            coinImage.image = Statistics.openImage(image: coinImageUrl!)
        }
    }
    
    public var coinNameFull: String?{
        didSet{
            coinNameFullLabel.text = coinNameFull
        }
    }
    
    private lazy var coinImage = UIImageView()
    
    
    var dataPoints = [String]()
    private lazy var marketPrice = [Double]()
    var values = [Double]()

    private lazy var coinNameShortLabel = UILabel()
    private lazy var dolarLabel = UILabel()
    private lazy var coinNameFullLabel = UILabel()
    private lazy var coinNameLabel = UILabel()
    private lazy var warningLabel = UILabel()
    private lazy var marketPriceLabel = UILabel()
    private lazy var marketPriceNameLabel = UILabel()
    private lazy var coinPriceLabel = UILabel()
    private lazy var coinTimeLabel = UILabel()
    private lazy var descriptionOfThePoint = UILabel()
    private lazy var lineLabel = UILabel()
    private lazy var lineLabel2 = UILabel()
    private lazy var lineLabel3 = UILabel()
    private lazy var dataOfThePoint = UILabel()
    private lazy var timeSelectionView = TimeButtons()
    
    let defaults = UserDefaults.standard
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame:CGRect){
        super.init(frame: frame)
        setup()
    }

    func setup(){
        
        timeSelectionView.delegate = self
        // Adding the constraints
        self.backgroundColor = .white
        self.addSubview(timeSelectionView)
        self.addSubview(coinTimeLabel)
        self.addSubview(coinPriceLabel)
        self.addSubview(marketPriceLabel)
        self.addSubview(descriptionOfThePoint)
        self.addSubview(allTimeLineChartView)
        self.addSubview(lineChartView)
        self.addSubview(coinImage)
        self.addSubview(dataOfThePoint)
        self.addSubview(coinNameFullLabel)
        self.addSubview(coinNameShortLabel)
        self.addSubview(warningLabel)
        self.addSubview(lineLabel)
        self.addSubview(lineLabel2)
        self.addSubview(lineLabel3)
        self.addSubview(marketPriceNameLabel)
        self.addSubview(coinNameLabel)

        descriptionOfThePoint.isHidden = false
        
        lineChartView.delegate = self
        lineChartView.xAxis.valueFormatter = self
        
        allTimeLineChartView.delegate = self
        allTimeLineChartView.xAxis.valueFormatter = self
        
        marketPriceNameLabel.text = "Капитал:"
        coinPriceLabel.text = "Текущая цена:"
        
        lineLabel.backgroundColor = .gray
        lineLabel2.backgroundColor = .gray
        lineLabel3.backgroundColor = .gray

        coinNameFullLabel.tintColor = .black
        coinNameShortLabel.tintColor = .black
        
        self.descriptionOfThePoint.font = UIFont(name: "Avenir Next Medium", size: 23)
        self.dataOfThePoint.font = UIFont(name: "Avenir Next Medium", size: 19)
        marketPriceNameLabel.font = UIFont(name: "Avenir Next Medium", size: 16)
        coinPriceLabel.font = UIFont(name: "Avenir Next Medium", size: 16)
        coinNameShortLabel.font = UIFont(name: "Avenir Next Medium", size: 14)
        coinNameFullLabel.font = UIFont(name: "Avenir Next Bold", size: 20)
        
        dataOfThePoint.textAlignment = .center
        descriptionOfThePoint.numberOfLines = 2
        
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        coinPriceLabel.easy.layout(Top(40), Width(140), RightMargin(20), Height(30))
        descriptionOfThePoint.easy.layout(TopMargin(52), Width(150), RightMargin(10), Height(50))
        marketPriceNameLabel.easy.layout(Top(3).to(descriptionOfThePoint), Width(140), RightMargin(20), Height(30))
        marketPriceLabel.easy.layout(Top(0).to(marketPriceNameLabel), Width(150), RightMargin(10), Height(30))
        coinImage.easy.layout(TopMargin(50),LeftMargin(30),Height(50),Width(50))
        coinNameFullLabel.easy.layout(TopMargin(55),Left(12).to(coinImage),Height(20),Width(80))
        coinNameShortLabel.easy.layout(Top(5).to(coinNameFullLabel), Left(12).to(coinImage), Height(20),Width(80))
        lineLabel.easy.layout(Bottom(5).to(dataOfThePoint), Right(0),Left(0), Height(1))
        lineLabel2.easy.layout(Bottom(43).to(dataOfThePoint), Right(0),Left(0), Height(1))
        dataOfThePoint.easy.layout(Height(30), RightMargin(0), LeftMargin(0),Top(240))
        lineChartView.easy.layout(Top(0).to(dataOfThePoint),RightMargin(-10), LeftMargin(-40), Height(250))
        timeSelectionView.easy.layout(Left(10),Right(10),Top(5).to(lineLabel2),Bottom(0).to(lineLabel))
        lineLabel3.easy.layout(Bottom(20), Right(20),Left(20), Height(1))
    }
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
       return ""
    }
    
    func changeTimeRange(_ data:String){
        
        self.showActivityIndicator()
        
        guard let coinName = coinName else {
            return
        }
        
        Statistics.changeTime(coinName: coinName,data: data){(el,ele,elee) in
            self.marketPrice = elee
            self.dataPoints = ele
            self.values = el
            if self.values.count != 0{
               self.hideActivityIndicator()
            }
            
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.currencySymbol = "$"
            formatter.maximumFractionDigits = 0;
            
            self.setChart(dataPoints: self.dataPoints, Values: self.values, chart: self.lineChartView)
            self.descriptionOfThePoint.text = "$" + String((round(self.values[self.values.count - 1]*1000)/1000))
            self.dataOfThePoint.text = " " + String(describing: self.dataPoints[self.dataPoints.count - 1])
            self.marketPriceLabel.text = formatter.string(for: (Int(round((self.marketPrice[(self.marketPrice.count) - 1])*1000)/1000)) as Int)!
        }
        
    }
    //MARK: when the user touches the screen of the graph
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        
        self.descriptionOfThePoint.text = "$" + String((round(entry.y*1000)/1000))
        self.dataOfThePoint.text = " " + String(describing: entry.data!)
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        formatter.maximumFractionDigits = 0;
        
        self.marketPriceLabel.text = formatter.string(for: Int(self.marketPrice[
            dataPoints.index(of: entry.data! as! String)!]) as Int)!
        
        descriptionOfThePoint.isHidden = false
        
    }
    
    func setChart(dataPoints:[String]?, Values:[Double], chart: LineChartView){
        
        var dataEntries: [ChartDataEntry] = []
        
        
        for i in 0..<dataPoints!.count{
            
            let DataEntry = ChartDataEntry(x: Double(i), y:Values[i],data: dataPoints?[i] as AnyObject)
            
            dataEntries.append(DataEntry)
            
        }
        
        let lineChartDataSet = LineChartDataSet(values: dataEntries, label: "Курс биткоина")
        
        lineChartDataSet.drawCirclesEnabled = false
        
        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        
        let gradientColors = [UIColor.mainAzure.cgColor] as CFArray // Colors of the gradient
        let colorLocations:[CGFloat] = [1.0, 0.0] // Positioning of the gradient
        let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradientColors, locations: colorLocations) // Gradient Object
        lineChartDataSet.fill = Fill.fillWithLinearGradient(gradient!, angle: 90.0) // Set the Gradient
        lineChartDataSet.drawFilledEnabled = true // Draw the Gradient
        let colors:[UIColor] = [UIColor.mainAzure, UIColor.mainDarkAzure]
        lineChartDataSet.colors = colors
        
        chart.leftAxis.labelTextColor = .white
        chart.leftAxis.drawGridLinesEnabled = false
        chart.rightAxis.drawGridLinesEnabled = false
        chart.xAxis.drawGridLinesEnabled = false
        
        chart.data = lineChartData
        chart.borderLineWidth = 4
        chart.data?.setValueTextColor(UIColor.clear)
        chart.backgroundColor = .white
        chart.rightAxis.drawLabelsEnabled = false
        chart.legend.enabled = false
        chart.clipValuesToContentEnabled = false
        chart.chartDescription?.text = ""
        
    }
}

extension Charts: ChangeTime{
    func change(_ name: String) {
        changeTimeRange(name)
    }
}
