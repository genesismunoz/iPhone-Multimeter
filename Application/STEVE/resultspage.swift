
//  resultspage.swift
//  STEVE
//
//  Created by Genesis Muñoz on 9/16/21.
//

import CoreBluetooth
import UIKit


class resultspage : UIViewController, CBCentralManagerDelegate, CBPeripheralDelegate{
   
   //The Following Omitted Due to complications in integration
   //Button outlets for Unit Conversion Options
   //    @IBOutlet weak var VoltageBtn: UIButton!
   //    @IBOutlet weak var CurrentBtn: UIButton!
   //    @IBOutlet weak var ContinuityBtn: UIButton!
   //    @IBOutlet weak var ResistivityBtn: UIButton!
   //    @IBOutlet weak var CapacitanceBtn : UIButton!
   @IBOutlet weak var NewMeasurementBtn : UIButton!
   
   //The Following Omitted Due to complications in integration
   //    Picker View: To select desired units of measurement
   //    @IBOutlet weak var pickerView: UIPickerView!
   //
   
   //Text field for results
   @IBOutlet weak var outputField: UITextField!
   
   //The Following Removed Due to complications in integration with Backend subsystem
   //Units for readings
   //    let voltageUnits = ["volts V", "milivolts mV", "kilovolts kV", "megavolts MV"]
   //    let currentUnits = ["amperes A", "miliamps mA", "kiloamps kA"]
   //    let resistivityUnits = ["ohms Ω", "kiloohms kΩ","megaohms MΩ"]
   //    let continuityUnits = ["circuit is continous" , "circuit is not continous", "circuit is live"]
   //    let capacitanceUnits = ["farads F", "nanofarads nF", "microfarads μF"]
   //    var tagID = 0
   //    var numRows = 0
   //    var buttonArray: [UIButton] = [VoltageBtn, CurrentBtn, ContinuityBtn, ResistivityBtn, CapacitanceBtn]
   
   override func viewDidLoad() {
   //   The Following Removed Due to complications in integration with Backend subsystem
   //   Pickerview Settings
   //   pickerView.isHidden = true
   //   pickerView.delegate = self
   //   pickerView.dataSource = self


   super.viewDidLoad()
   //The Following Removed Due to complications in integration with Backend subsystem
       centralManager = CBCentralManager(delegate: self, queue: nil)
   //  look for voltage button
   //  VoltageBtn.layer.borderWidth = 2
   //  VoltageBtn.layer.borderColor = UIColor.black.cgColor
   //  VoltageBtn.tag = 1
   //Design for current button
   //  CurrentBtn.layer.borderWidth = 2
   //  CurrentBtn.layer.borderColor = UIColor.black.cgColor
   //  CurrentBtn.tag = 2
   // Design for current button
   //  ContinuityBtn.layer.borderWidth = 2
   //  ContinuityBtn.layer.borderColor = UIColor.black.cgColor
   //  ContinuityBtn.tag = 3
   // Design for current button
   //  ResistivityBtn.layer.borderWidth = 2
   //  ResistivityBtn.layer.borderColor = UIColor.black.cgColor
   //  ResistivityBtn.tag = 4
   // Design for current button
   //  CapacitanceBtn.layer.borderWidth = 2
   //  CapacitanceBtn.layer.borderColor = UIColor.black.cgColor
   //  CapacitanceBtn.tag = 5

       //New measurement Button Tag
       NewMeasurementBtn.tag = 6
   }
   
   //Clear Text Field to Allow for New Measurements
   @IBAction func newMeasurementPressed(_sender: UIButton){
       if _sender.tag == 6{
           _sender.backgroundColor = UIColor.gray
           //outputField.text = str
       //The Following Removed Due to complications in integration with Backend subsystem
       //  }
       //  if CapacitanceBtn.backgroundColor == UIColor.gray{
       //  CapacitanceBtn.backgroundColor = UIColor(red: 244.0/255.0, green: 229.0/255.0, blue: 5.0/255.0, alpha: 1)
       //  }
       //  if ResistivityBtn.backgroundColor == UIColor.gray{
       //  ResistivityBtn.backgroundColor = UIColor(red: 244.0/255.0, green: 229.0/255.0, blue: 5.0/255.0, alpha: 1)
       //   }
       //  if ContinuityBtn.backgroundColor == UIColor.gray{
       //  ContinuityBtn.backgroundColor = UIColor(red: 244.0/255.0, green: 229.0/255.0, blue: 5.0/255.0, alpha: 1)
       //   }
       //  if CurrentBtn.backgroundColor == UIColor.gray{
       //  CurrentBtn.backgroundColor = UIColor(red: 244.0/255.0, green: 229.0/255.0, blue: 5.0/255.0, alpha: 1)
       //  }
       //  if VoltageBtn.backgroundColor == UIColor.gray{
       //  VoltageBtn.backgroundColor = UIColor(red: 244.0/255.0, green: 229.0/255.0, blue: 5.0/255.0, alpha: 1)
       //   }
       NewMeasurementBtn.backgroundColor = UIColor(red: 244.0/255.0, green: 229.0/255.0, blue: 5.0/255.0, alpha: 1)//Set Color Button to our custom
   }
   
   
       //The Following Removed Due to complications in integration with Backend subsystem
   //Give unit options for each reading selected
   //    @IBAction func readingPressed(_sender: UIButton){
   //  if pickerView.isHidden{
   //  pickerView.isHidden = false
   //  }
   //        switch _sender.tag{//Button Feedback: when pressed turn gray
   //        case 1:
   //            tagID = 1
   //            _sender.backgroundColor = UIColor.gray
   //        case 2:
   //            tagID = 2
   //            _sender.backgroundColor = UIColor.gray
   //        case 3:
   //            tagID = 3
   //            _sender.backgroundColor = UIColor.gray
   //        case 4:
   //            tagID = 4
   //            _sender.backgroundColor = UIColor.gray
   //        case 5:
   //            tagID = 5
   //            _sender.backgroundColor = UIColor.gray
   //        default :
   //            break
   //
   //        }
   //    }
   
   //    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {//Number of Units available per Measurement
   //        if(self.tagID == 1){
   //            return voltageUnits.count
   //        }
   //        else if(self.tagID == 2){
   //            return currentUnits.count
   //        }
   //        else if(self.tagID == 3){
   //            return continuityUnits.count
   //        }
   //        else if(self.tagID == 4){
   //            return resistivityUnits.count
   //        }
   //        else{//tag must be 5
   //            return capacitanceUnits.count
   //        }
   //    }
   
   //    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {//Place Units as Options in Picker View
   //        if(self.tagID == 1){
   //            return voltageUnits[row]
   //        }
   //        else if(self.tagID == 2){
   //            return currentUnits[row]
   //        }
   //        else if(self.tagID == 3){
   //            return continuityUnits[row]
   //        }
   //        else if(self.tagID == 4){
   //            return resistivityUnits[row]
   //        }
   //        else{//tag must be 5
   //            return capacitanceUnits[row]
   //        }
   //    }
   
   //swift wanted this, just a repetition numberofrowsincomponent
   func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
   }
   
   //Formating Results in Tesxt Field
   //    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
   //        if(self.tagID == 1){
   //            outputField.text = "Measuring for " + voltageUnits[row]
   //        }
   //        else if(self.tagID == 2){
   //            outputField.text = "Measuring for " + currentUnits[row]
   //        }
   //        else if(self.tagID == 3){
   //            outputField.text = "Checking if" + continuityUnits[row]
   //        }
   //        else if(self.tagID == 4){
   //            outputField.text = "Measuring for " + resistivityUnits[row]
   //        }
   //        else{//tag must be 5
   //            outputField.text = "Measuring for " + capacitanceUnits[row]
   //        }
   //        pickerView.isHidden = true
   //    }
}
   var centralManager: CBCentralManager!
   var myPeripheral: CBPeripheral!
   var peripheral: CBPeripheral!
   var manager:CBCentralManager!
   var cdata: CBCharacteristic!
   private var rxCharacteristic: CBCharacteristic!
   /*struct *Constants{
       static var datah = ""
       
   }*/
   
   
   func centralManagerDidUpdateState(_ central: CBCentralManager) {
       switch central.state{
   
       case .unknown:
           print("unknown")
       case .resetting:
           print("resetting")
       case .unsupported:
           print("unsupported")
       case .unauthorized:
           print("unauthorized")
       case .poweredOff:
           print("powered off")
       case .poweredOn:
           print("powered on")
           central.scanForPeripherals(withServices: nil, options: nil)
       
       @unknown default:
           return
       }
       /*f central.state == CBManagerState.poweredOn{
                  print ("Bluetooth powered on")
                  
                  central.scanForPeripherals(withServices: nil, options: nil)
              }else {
                  print("Something wrong fix me")
              }*/
   }
   
   func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
           if let pname = peripheral.name {
              if pname == "DSD TECH"{
                self.centralManager.stopScan()
                  
                 self.myPeripheral = peripheral
                   self.myPeripheral.delegate = self
                   self.centralManager.connect(peripheral, options: nil)
                  print("Connected")
               }
           }
       /*self.centralManager.stopScan()
         
        self.myPeripheral = peripheral
          self.myPeripheral.delegate = self
          self.centralManager.connect(peripheral, options: nil)*/
       }
   func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
       self.myPeripheral.discoverServices(nil)
   }
   func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
       if let peripheralServices = peripheral.services{
           print ("list of services")
           for service in peripheralServices{
               print (service.uuid)
               print (service.uuid.uuidString)
               if service.uuid == CBUUID(string: "FFE0"){
                   self.myPeripheral.discoverCharacteristics(nil, for: service)
               }
           }
       }
   }
   func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
       if let serviceCharacteristics = service.characteristics{
           for characteristic in serviceCharacteristics {
               if characteristic.uuid == CBUUID(string:"FFE1"){
                   self.cdata = characteristic
                   self.myPeripheral.setNotifyValue(true, for: cdata)
               }
           }
       }
   }
   
  
   
   override func didReceiveMemoryWarning() {
       super.didReceiveMemoryWarning()
       // Dispose of any resources that can be recreated.
       manager = CBCentralManager(delegate: self, queue: nil)
   }
   func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
       
       if characteristic.uuid == cdata.uuid{
           if let data = characteristic.value{
               print (data)
               /*Constants.datah = data.map{String(format: "%02x",$0)}.joined()
               let hextodecimaldata = Int(*Constants.datah, radix:16 )!
//                print (hextodecimaldata)*/
               let str = String(data: data, encoding: String.Encoding.utf8)!
               print(str)
               outputField.text = str
              /* var bytes = [UInt8](repeating: 0, count: data.count / MemoryLayout<UInt8>.size)
               (data as NSData).getBytes(&bytes, length: data.count)
               print (bytes)*/
               
           }
       }
       
       
   }
}
