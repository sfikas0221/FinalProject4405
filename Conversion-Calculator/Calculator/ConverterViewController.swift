//
//  ConverterViewController.swift Calculator
//
//  Created by Stelios Fikas
//

import UIKit

class ConverterViewController: UIViewController {
    
    var userInput = ""
    var buttonVal = ""
    var converterArray: [Converter] = [Converter]()
    var activeConverterIndex = 0
    var currentNum: Double? = 0
    
    // IBOutlets and IBAction
    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    @IBAction func numButtons(_ sender: UIButton) {
        
        buttonVal = String(sender.tag-1)
        userInput.append(buttonVal)
        inputDisplay.text = userInput + converterArray[activeConverterIndex].inputUnit
     
        if let currentNum = Double(userInput){
        
            outputDisplay.text = doConversion(currentNum: currentNum )
        }
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        
        inputDisplay.text = "" + converterArray[activeConverterIndex].inputUnit
        userInput = ""
        currentNum = 0
        outputDisplay.text = "" + converterArray[activeConverterIndex].outputUnit
    }
    
    @IBAction func negativeButton(_ sender: UIButton) {
        
        if(self.userInput.first != "-"){
            self.userInput = "-" + self.userInput
        }
        
        inputDisplay.text = userInput + converterArray[activeConverterIndex].inputUnit
        
    }
    
    @IBAction func decimalButton(_ sender: UIButton) {
        userInput.append(".")
        inputDisplay.text = userInput + converterArray[activeConverterIndex].inputUnit
    }
    
    // Add actions
    @IBAction func converterButtonClick(_ sender: Any) {
        let alert = UIAlertController(title: "Choose Converter", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        
        alert.addAction(UIAlertAction(title: converterArray[0].label, style: UIAlertAction.Style.default, handler: {
            (alertAction) -> Void in
            self.outputDisplay.text = self.converterArray[0].outputUnit
            self.activeConverterIndex = 0
            self.inputDisplay.text = self.converterArray[0].inputUnit
        }))
        
        alert.addAction(UIAlertAction(title: converterArray[1].label, style: UIAlertAction.Style.default, handler: {
            (alertAction) -> Void in
            self.outputDisplay.text = self.converterArray[1].outputUnit
            self.activeConverterIndex = 1
            self.inputDisplay.text = self.converterArray[1].inputUnit
        }))
        
        alert.addAction(UIAlertAction(title: converterArray[2].label, style: UIAlertAction.Style.default, handler: {
            (alertAction) -> Void in
            self.outputDisplay.text = self.converterArray[2].outputUnit
            self.activeConverterIndex = 2
            self.inputDisplay.text = self.converterArray[2].inputUnit
        }))
        
        alert.addAction(UIAlertAction(title: converterArray[3].label, style: UIAlertAction.Style.default, handler: {
            (alertAction) -> Void in
            self.outputDisplay.text = self.converterArray[3].outputUnit
            self.activeConverterIndex = 3
            self.inputDisplay.text = self.converterArray[3].inputUnit
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    // menu
    override func viewDidLoad() {
        super.viewDidLoad()
        converterArray =  [Converter(label: "fahrenheit to celcius", inputUnit: "°F", outputUnit: "°C"),
                           Converter(label: "celcius to fahrenheit", inputUnit: "°C", outputUnit: "°F"),
                           Converter(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km"),
                           Converter(label: "kilometers to miles", inputUnit: "km", outputUnit: "mi")]
        outputDisplay.text = converterArray[0].outputUnit
        inputDisplay.text = converterArray[0].inputUnit
    }
    
    // possible cases
    func doConversion(currentNum: Double) -> String{
        switch converterArray[activeConverterIndex].label{
        case "fahrenheit to celcius":
                outputDisplay.text! = String((currentNum - 32) * (5/9))
        case "celcius to fahrenheit":
                outputDisplay.text! = String((currentNum * (9/5) + 32))
        case "miles to kilometers":
                outputDisplay.text! = String(currentNum * 0.62137)
        case "kilometers to miles":
                outputDisplay.text! = String(currentNum / 0.62137)
        default:
            break
        }
        return outputDisplay.text! + converterArray[activeConverterIndex].outputUnit
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
