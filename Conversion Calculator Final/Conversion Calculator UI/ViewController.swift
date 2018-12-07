//
//  ViewController.swift
//  Conversion Calculator UI
//
//  Created by Andrew Bui on 10/26/18.
//  Copyright © 2018 Andrew Bui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let alert = UIAlertController(title: "Choose Converter", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
    
    @IBOutlet weak var outputDisplay: UITextField!
    
    @IBOutlet weak var inputDisplay: UITextField!
  
    var converters = [Converter]()
    var currConverter = 0
  //  var currentindex = 0

//    var converters = [Converter(label: "fahrenheit to celcius", inputUnit: "°F", outputUnit: "°C"),
 //                     Converter(label: "celcius to fahrenheit", inputUnit: "°C", outputUnit: "°F"),
 //                     Converter(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km"),
 //                     Converter(label: "kilometers to miles", inputUnit: "km", outputUnit: "mi")]

    override func viewDidLoad() {
        super.viewDidLoad()
     //  outputDisplay.placeholder = "C"
     //   inputDisplay.placeholder = "F"
        // Do any additional setup after loading the view, typically from a nib.
        converters = [Converter(label: "fahrenheit to celcius", inputUnit: "°F", outputUnit: "°C"),
                         Converter(label: "celcius to fahrenheit", inputUnit: "°C", outputUnit: "°F"),
                          Converter(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km"),
                        Converter(label: "kilometers to miles", inputUnit: "km", outputUnit: "mi")]
       
      
        for(index,converter) in converters.enumerated(){
            alert.addAction(UIAlertAction(title: converter.label, style: .default,handler:{
               (alertAction) -> Void in
                self.currConverter = index
                self.inputDisplay.placeholder = converter.inputUnit
                self.outputDisplay.placeholder = converter.outputUnit
                self.updateText()
            }))
        }
//        inputDisplay.text = converters[0].inputUnit
  //      outputDisplay.text = converters[0].outputUnit
        
    }

 //   @IBAction func convert(_ sender: AnyObject) {
 //       let alert = UIAlertController(title: "Choose conversion", message: nil, //preferredStyle: .actionSheet)
//        alert.addAction(UIAlertAction(title: "fahrenheit to celcius", style: UIAlertAction.Style.default, handler: {
//            (alertAction) -> Void in
//           self.outputDisplay.placeholder = "°C"
 //           self.inputDisplay.placeholder = "°F"
//            self.currentindex = 0
//        }))
//        alert.addAction(UIAlertAction(title: "celcius to fahrenheit", style: UIAlertAction.Style.default, handler: {
//            (alertAction) -> Void in
 //           self.outputDisplay.placeholder = "°F"
//            self.inputDisplay.placeholder = "°C"
//            self.currentindex = 1
 //       }))
  //      alert.addAction(UIAlertAction(title: "miles to kilometers", style: UIAlertAction.Style.default, handler: {
  //          (alertAction) -> Void in
 //           self.outputDisplay.placeholder = "km"
 //           self.inputDisplay.placeholder = "mi"
//            self.currentindex = 2
  //      }))
 //       alert.addAction(UIAlertAction(title: "kilometers to miles", style: UIAlertAction.Style.default, handler: {
 //           (alertAction) -> Void in
 //           self.outputDisplay.placeholder = "mi"
  //          self.inputDisplay.placeholder = "km"
   //         self.currentindex = 3
    //    }))
   //     self.present(alert, animated: true, completion: nil)
 //   }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func converterButtonTapped(_sender: UIButton)
    {
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func clearTapped(_sender: UIButton)
    {
        inputDisplay.text = nil
        outputDisplay.text = nil
    }
    
    func f2c(_fahrenheit: Double) -> Double{
        return (_fahrenheit - 32) * (5/9)
    }
    
    func c2f(_celcius: Double) -> Double
    {
        return _celcius * (9/5) + 32
    }
    
    func k2m(_kilometers: Double) -> Double
    {
        return 0.62 * _kilometers
    }
    
    func m2k(_miles: Double) -> Double
    {
        return 1.61 * _miles
    }
    
    @IBAction func toggleSign(){
        if let text = inputDisplay.text,
        var inputDouble = Double(text)
        {
            inputDouble *= -1
            inputDisplay.text = "\(inputDouble)"
            updateText()
        }
        else
        {
            inputDisplay.text = "-"
            outputDisplay.text = "-"
        }
    }
    
    func updateText()
    {
        if let text = inputDisplay.text,
        let input = Double(text){
            var output: Double
            
            switch currConverter{
            case 0:
                output = f2c(_fahrenheit: input)
            case 1:
                output = c2f(_celcius: input)
            case 2:
                output = m2k(_miles: input)
            case 3:
                output = k2m(_kilometers: input)
            default:
                    return
            }
            outputDisplay.text = "\(output)"
        }
        
    }
    
    
}
    
    
 
