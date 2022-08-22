//
//  beziergraphs.swift
//  STEVE
//
//  Created by Genesis Muñoz.
//

import UIKit
import Charts//Public Package Installed with CocoaPods

class beziergraphs: ViewController, ChartViewDelegate{
    
    //The Following Omitted Due to complications in integration
//    let url = NSURL(string: "http://localhost:8888/retreive.php") // locahost MAMP - change to point to database server
//
//    var request = URLRequest(url: url! as URL)
//    request.httpMethod = "POST"
//
//    var dataString = "secretWord=44fdcv8jf3" // starting POST string with password 
    
    
    
    
    //Label Outlet to update reading showed
    
    @IBOutlet weak var measurementName: UITextField!
    
    //Sample Measurement Arrays, mimic what Database would've stored
    let voltagePoints = [0.99, 1.46, 1.964, 2.495, 3.28 , 5, -6, 7.54, 9.09, 10.07, 12.005, 15.005]
    let currentPoints = [4, 52.4, 88.9, 101, 231.3, 427.4, 547.9, 997, 1002.7]
    let resistancePoints = [0.98, 441.52, 2152.86, 2200, 9756.11, 9961.01, 199.2, 7619.06, 2541.4, 1140]
    let capacitancePoints = [0.116, 10.11, 34.3, 103.4, 220.86, 974.6]
    
    var entryArray = [Double]()
    
    var lineChart = LineChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lineChart.delegate = self
        
    }
    

    override func viewDidLayoutSubviews() {
        
        
        //Filter Measurements for Graphs
        
        //Filter out Negative Values to Graphs only positive
        let posVoltage = voltagePoints.filter { $0 > 0 }
        let posCurrent = currentPoints.filter { $0 > 0 }
        let posResistance = resistancePoints.filter { $0 > 0 }
        let posCap = capacitancePoints.filter { $0 > 0 }
        
        //Order in Ascending Order to follow Package Guidelines
        let validVoltage = posVoltage.sorted()
        let validCurrent = posCurrent.sorted()
        let validResistance = posResistance.sorted()
        let validCap = posCap.sorted()
        
        super.viewDidLayoutSubviews()
        lineChart.frame = CGRect(x: 0, y: 0, width: 400.0, height: 400.0)//Set up graph space on screen, works on the tested visibility ranges
        lineChart.center = view.center
        view.addSubview(lineChart)
        
        var entries = [ChartDataEntry]()
        
        //Uncomment Case that will be in use
        
       //CASE 1: Graph Voltage
        for x in 0..<validVoltage.count {
            entries.append(ChartDataEntry(x: validVoltage[x], y: validVoltage[x]))
            self.measurementName.text = "Showing Latest Voltage Values!"
        }
        
        //CASE 2: Graph Current
//        for x in 0..<validCurrent.count {
//            entries.append(ChartDataEntry(x: validCurrent[x], y: validCurrent[x]))
//              self.measurementName.text = "Showing Latest Current Values!"
//        }
        
        //CASE 3: Graph Resistance
//        for x in 0..<validResistance.count {
//            entries.append(ChartDataEntry(x: validResistance[x], y: validResistance[x]))
//            self.measurementName.text = "Showing Latest Resistance Values!"
//        }

        //CASE 4: Graph Capacitance
//        for x in 0..<validCap.count {
//            entries.append(ChartDataEntry(x: validCap[x], y: validCap[x]))
//            self.measurementName.text = "Showing Latest Capacitance Values!"
//        }

        let set = LineChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.joyful()
        let data = LineChartData(dataSet: set)
        lineChart.data = data
        

    }
}
