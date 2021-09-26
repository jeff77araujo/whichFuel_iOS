//
//  ViewController.swift
//  whichFuel
//
//  Created by Jefferson Oliveira de Araujo on 25/09/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var priceAlcohol: UITextField!
    @IBOutlet weak var priceGasoline: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        message.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func changedTextAlcohol(_ sender: Any) {
        message.isHidden = true
    }
    
    @IBAction func changedTextGasoline(_ sender: Any) {
        message.isHidden = true
    }
    
    @IBAction func calculateFuel(_ sender: Any) {
        if let priceAlcohol = priceAlcohol.text {
            if let priceGasoline = priceGasoline.text {
                self.valideteValues(priceAlcohol: priceAlcohol, priceGasoline: priceGasoline)
            }
        }
    }
    
    func valideteValues(priceAlcohol: String, priceGasoline: String) {
        message.isHidden = false
        if priceAlcohol.isEmpty || priceGasoline.isEmpty {
            message.text = "Digite os preços dos combustíveis!"
        } else {
            betterFuel(priceAlcohol: priceAlcohol, priceGasoline: priceGasoline)
        }
    }
    
    func betterFuel (priceAlcohol: String, priceGasoline: String) {
        if let priceAlcohol = Double(priceAlcohol) {
            if let priceGasoline = Double(priceGasoline) {
                let resultFuel = priceAlcohol / priceGasoline
                if resultFuel >= 0.7 {
                    self.message.text = "Melhor usar Gasolina!"
                } else {
                    self.message.text = "Melhor usar Álcool!"
                }
            }
        }
    }
}
