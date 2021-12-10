//
//  ViewController.swift
//  Tipster
//
//  Created by admin on 07/12/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var dot = false
    var num = 0.00
    var numString = ""
    var groub = 1
    var amount = 0.00
    var totale1 = 0.00
    var totale2 = 0.00
    var totale3 = 0.00
    
    // Connect all number
    @IBAction func b9(_ sender: UIButton) {
        updateText(Number: "9")
    }
    @IBAction func b8(_ sender: UIButton) {
        updateText(Number: "8")
    }
    @IBAction func b7(_ sender: UIButton) {
        updateText(Number: "7")
    }
    @IBAction func b6(_ sender: UIButton) {
        updateText(Number: "6")
    }
    @IBAction func b5(_ sender: UIButton) {
        updateText(Number: "5")
    }
    @IBAction func b4(_ sender: UIButton) {
        updateText(Number: "4")
    }
    @IBAction func b3(_ sender: UIButton) {
        updateText(Number: "3")
    }
    @IBAction func b2(_ sender: UIButton) {
        updateText(Number: "2")
    }
    @IBAction func b1(_ sender: UIButton) {
        updateText(Number: "1")
    }
    @IBAction func b0(_ sender: UIButton) {
        if lblBill.text != "0"{
            updateText(Number: "0")
        }
    }
    // Clear the vlues
    @IBAction func bC(_ sender: UIButton) {
        numString = ""
        lblBill.text = ""
    }
    // Add dot
    @IBAction func bDot(_ sender: UIButton) {
        if dot == false{
            updateText(Number: ".")
            dot = true
        }
    }
    @IBOutlet weak var lblBill: UILabel!
    
    @IBAction func sTip(_ sender: UISlider) {
        lblTip1.text = "\(Int(sender.value))%"
        let amount1 = tipAmount(tip: Int(sender.value))
        lblAmount1.text = String(format: "%.02f", amount1)
        totale1 = totale(amount: amount1)
        lblTotale1.text = String(format: "%.02f", totale1)
        
        lblTip2.text = "\(Int(sender.value + 5))%"
        let amount2 = tipAmount(tip: Int(sender.value + 5))
        lblAmount2.text = String(format: "%.02f", amount2)
        totale2 = totale(amount: amount2)
        lblTotale2.text = String(format: "%.02f", totale2)
        
        lblTip3.text = "\(Int(sender.value + 10))"
        let amount3 = tipAmount(tip: Int(sender.value + 10))
        lblAmount3.text = String(format: "%.02f", amount3)
        totale3 = totale(amount: amount3)
        lblTotale3.text = String(format: "%.02f", totale3)
    }
    
    @IBOutlet weak var lblGroup: UILabel!
    @IBAction func sGroup(_ sender: UISlider) {
        lblGroup.text = "Group Size: \(Int(sender.value))"
        groub = Int(sender.value)
        
        lblTotale1.text = String(format: "%.02f", totale1/Double(groub))
        
        lblTotale2.text = String(format: "%.02f", totale2/Double(groub))
        
        lblTotale3.text = String(format: "%.02f", totale3/Double(groub))
    }
    
    // Tip%
    @IBOutlet weak var lblTip1: UILabel!
    @IBOutlet weak var lblTip2: UILabel!
    @IBOutlet weak var lblTip3: UILabel!
    
    // Tip from the amount
    @IBOutlet weak var lblAmount1: UILabel!
    @IBOutlet weak var lblAmount2: UILabel!
    @IBOutlet weak var lblAmount3: UILabel!
    
    // Totale
    @IBOutlet weak var lblTotale1: UILabel!
    @IBOutlet weak var lblTotale2: UILabel!
    @IBOutlet weak var lblTotale3: UILabel!
    
    
    
    func updateText(Number: String){
        if lblBill.text != "0" {
            numString = "\(numString)\(Number)"
            lblBill.text = numString
        }else{
            numString = "\(Number)"
            lblBill.text = numString
        }
    }
    
    func tipAmount(tip: Int) ->  Double{
        num = Double(numString) ?? 1
        print(num)
        return num * (Double(tip)/100)
    }
    
    func totale(amount: Double) -> Double{
        let bill = Double(lblBill.text ?? "1.00") ?? 1.00
        return amount + bill
    }
    
    
}

