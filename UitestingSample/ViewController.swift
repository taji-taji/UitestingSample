//
//  ViewController.swift
//  UitestingSample
//
//  Created by tajika on 2016/01/10.
//  Copyright © 2016年 Tajika. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var leftValueTextField: UITextField!
    @IBOutlet weak var rightValueTextField: UITextField!
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultButton.enabled = false
        leftValueTextField.delegate = self
        rightValueTextField.delegate = self
    }

    @IBAction func showResult(sender: UIButton) {
        if validate() {
            let leftValue = Float(leftValueTextField.text!)
            let rightValue = Float(rightValueTextField.text!)
            let result = leftValue! * rightValue!
            resultLabel.text = String(result)
        }
    }
    
    private func validate() -> Bool {
        if leftValueTextField.text == nil {
            return false
        }
        if rightValueTextField.text == nil {
            return false
        }
        if Float(leftValueTextField.text!) == nil {
            return false
        }
        if Float(rightValueTextField.text!) == nil {
            return false
        }
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // キーボードを隠す
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func textFieldEditingChanged(sender: UITextField) {
        resultButton.enabled = validate()
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        // 入力中のsaveボタンを使用不可にする
        resultButton.enabled = false
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        resultButton.enabled = validate()
    }

}

