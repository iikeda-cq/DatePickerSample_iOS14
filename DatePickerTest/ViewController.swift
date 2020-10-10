//
//  ViewController.swift
//  DatePickerTest
//
//  Created by 池田一成 on 2020/09/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
        
        var datePicker: UIDatePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // ピッカー設定
        datePicker.datePickerMode = UIDatePicker.Mode.dateAndTime
        datePicker.timeZone = NSTimeZone.local
        datePicker.locale = Locale.current
//        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.setValue(false, forKey: "highlightsToday")
        textField.inputView = datePicker
        
        // 決定バーの生成
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spacelItem, doneItem], animated: true)
        
        // インプットビュー設定
        textField.inputView = datePicker
        textField.inputAccessoryView = toolbar
    }
    // 決定ボタン押下
        @objc func done() {
            textField.endEditing(true)
            
            // 日付のフォーマット
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            textField.text = "\(formatter.string(from: Date()))"
        }
}

