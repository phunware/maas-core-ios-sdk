//
//  AnalyticsViewController.swift
//  CoreSample
//
//  Created on 4/24/17.
//  Copyright © 2017 Phunware. All rights reserved.
//

import UIKit
import PWCore

class AnalyticsViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var addToCartButton: UIButton!
    
    @IBOutlet weak var eventNameTextField: UITextField!
    @IBOutlet weak var eventParametersTextField: UITextField!
    @IBOutlet weak var addCustomEventButton: UIButton!
    
    let itemColors = ["White", "Blue", "Yellow"];
    var selectedColor: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        selectedColor = itemColors[0]
        
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        PWAnalytics.setScreenName("Analytics")
        PWAnalytics.setAppSection("Analytics Section")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        PWAnalytics.addCustomEvent("Events Page View")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func configureView() {
        let blueColor = UIColor(red: 0 / 255.0, green: 182 / 255.0, blue: 235 / 255.0, alpha: 1.0)
        redButton.backgroundColor = UIColor(red: 248 / 255.0, green: 92 / 255.0, blue: 86 / 255.0, alpha: 1.0)
        greenButton.backgroundColor = UIColor(red: 54 / 255.0, green: 252 / 255.0, blue: 56 / 255.0, alpha: 1.0)
        
        redButton.setTitle("Red Event", for: .normal)
        greenButton.setTitle("Green Event", for: .normal)
        
        redButton.addTarget(self, action: #selector(redButtonPressed(_:)), for: .touchUpInside)
        greenButton.addTarget(self, action: #selector(greenButtonPressed(_:)), for: .touchUpInside)
        
        segmentedControl.setTitle("Baseball", forSegmentAt: 0)
        segmentedControl.setTitle("Softball", forSegmentAt: 1)
        segmentedControl.setTitle("Golf ball", forSegmentAt: 2)
        
        addToCartButton.backgroundColor = blueColor
        addToCartButton.setTitle("Add to Cart", for: .normal)
        addToCartButton.addTarget(self, action: #selector(addToCartButtonPressed(_:)), for: .touchUpInside)
        
        addCustomEventButton.setTitle("Add Custom Event", for: .normal)
        addCustomEventButton.addTarget(self, action: #selector(addCustomEventButtonPressed(_:)), for: .touchUpInside)
        
        eventNameTextField.delegate = self
        eventParametersTextField.delegate = self
    }
}

// MARK: Button Actions

extension AnalyticsViewController {
    
    @objc func redButtonPressed(_ sender: UIButton) {
        PWAnalytics.addCustomEvent("Red Button Pressed")
    }
    
    @objc func greenButtonPressed(_ sender: UIButton) {
        PWAnalytics.addCustomEvent("button_pressed", withParameters: ["button_name" : "green"])
    }
    
    @objc func addToCartButtonPressed(_ sender: UIButton) {
        let selectedSegmentTitle = segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex)!
        let parameters: [String : String] = ["item_name" : selectedSegmentTitle, "item_color" : selectedColor]
        PWAnalytics.addCustomEvent("add_to_cart", withParameters: parameters)
    }
    
    @objc func addCustomEventButtonPressed(_ sender: UIButton) {
        view.endEditing(true)
        guard let eventName = eventNameTextField.text, eventName.count > 0 else {
            return
        }
        var parameters = [String: String]()
        if let parameterText = eventParametersTextField.text, parameterText.count > 0 {
            let keyValuePairs = parameterText.components(separatedBy: ",")
            for keyValuePair in keyValuePairs {
                let keysValues = keyValuePair.components(separatedBy: ":")
                if keysValues.count == 2 {
                    let key = keysValues[0].trimmingCharacters(in: .whitespaces)
                    let value = keysValues[1].trimmingCharacters(in: .whitespaces)
                    parameters[key] = value
                }
            }
        }
        PWAnalytics.addCustomEvent(eventName, withParameters: parameters)
    }
}

extension AnalyticsViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
}

extension AnalyticsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return itemColors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return itemColors[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedColor = itemColors[row]
    }
}

// MARK: UIKeyboard Methods

extension AnalyticsViewController {
    
    @objc func keyboardDidShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let insets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.size.height, right: 0)
            scrollView.contentInset = insets
            scrollView.scrollIndicatorInsets = insets
        }
    }
    
    @objc func keyboardWillHide() {
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
