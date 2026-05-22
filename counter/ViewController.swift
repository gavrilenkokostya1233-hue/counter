//
//  ViewController.swift
//  counter
//
//  Created by Konstantin on 21.05.2026.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var buttonZero: UIButton!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTextView.isScrollEnabled = true
        historyTextView.isEditable = false
        historyTextView.isSelectable = false
        
    }
    @IBAction func TouchDownButton(_ sender: Any) {
        count += 1
        numberLabel.text = "\(count)"
        let now = Date()
        let formater = DateFormatter()
        formater.dateStyle = .medium
        formater.timeStyle = .short
        let dateString = formater.string(from: now)
        
        let history = "\n" + dateString + "\n" + " Значение изменено на +1"
        let oldText = historyTextView.text ?? "" + "\n"
        historyTextView.text = oldText + "\n" + history 
    }

    @IBAction func TouchDownMinusButton(_ sender: Any) {
        if count > 0 {
            count -= 1
            numberLabel.text = "\(count)"
            let now = Date()
            let formater = DateFormatter()
            formater.dateStyle = .medium
            formater.timeStyle = .short
            let dateString = formater.string(from: now)
            
            let history = "\n" + dateString + "\n" + " Значение изменено на -1"
            let oldText = historyTextView.text ?? "" + "\n"
            historyTextView.text = oldText + "\n" + history
            
        } else {
            let now = Date()
            let formater = DateFormatter()
            formater.dateStyle = .medium
            formater.timeStyle = .short
            let dateString = formater.string(from: now)
            
            let history = "\n" + dateString + "\n" + "Попытка уменьшить значение счетчика ниже 0"
            let oldText = historyTextView.text ?? "" 
            historyTextView.text = oldText + "\n" + history
        }
    }
   
    @IBAction func TouchDownZeroingOut(_ sender: Any) {
        count = 0
        numberLabel.text = "\(count)"
        let now = Date()
        let formater = DateFormatter()
        formater.dateStyle = .medium
        formater.timeStyle = .short
        let dateString = formater.string(from: now)
        
        let history = "\n" + dateString + "\n" + " Значение сброшено"
        let oldText = historyTextView.text ?? "" + "\n"
        historyTextView.text = oldText + "\n" + history 
    }
    
}

