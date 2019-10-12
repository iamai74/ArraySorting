//
//  ViewController.swift
//  ArraySort
//
//  Created by AI on 12.10.2019.
//  Copyright © 2019 iamai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var arraySizeTextInput: UITextField!
    @IBOutlet weak var sourceArrayLabel: UILabel!
    @IBOutlet weak var sortArrayLabel: UILabel!
    
    private var sourceArray: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onDonePressed(_ sender: Any) {
        let isValidSize = validateArraySize(value: arraySizeTextInput.text)
        guard isValidSize else {return}
        let arraySize = Int(arraySizeTextInput.text!)
        sourceArray = [Int](1...arraySize!)
        sourceArrayLabel.text = "Source array: \(sourceArray)"
        var resultArray: [Int] = []
        resultArray = sourceArray.filter({$0%3 == 0})
        let otherPartArray = sourceArray.filter({$0%3 != 0}).sorted().reversed()
        resultArray += otherPartArray
        sortArrayLabel.text = "Sorted array: \(resultArray)"
    }
    
    private func validateArraySize(value: String?) -> Bool {
        if value == nil || value!.isEmpty {
            showErrorAlert(message: "Need to input array size")
            return false
        }
        guard let intValue = Int(value!) else {
            showErrorAlert(message: "Need to input Integer value")
            return false
        }
        guard intValue > 1 && intValue <= 10000 else {
            showErrorAlert(message: "Value need to be between 2 and 10000")
            return false
        }
        return true
    }
    
    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated:true, completion: nil)
    }
}

