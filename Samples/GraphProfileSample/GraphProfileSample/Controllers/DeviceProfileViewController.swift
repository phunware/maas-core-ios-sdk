//
//  ViewController.swift
//  GraphProfileSample
//
//  Created by on 11/8/18.
//  Copyright © 2018 Phunware. All rights reserved.
//

import UIKit
import PWCore

class DeviceProfileViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingView: UIView!
    
    var tableTitle = "Device Profile"
    
    var deviceProfileItemArray: [Mirror.Child]?
    var selectedDeviceProfileItem: Mirror.Child?
    var selectedDeviceProfileItemIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = tableTitle
        
        // TODO: Currently set to use current device's id. Manually change to any device id as needed.
        let deviceId: String? = PWCore.deviceID()
        
        if let deviceId = deviceId, deviceProfileItemArray == nil {
            loadingView.isHidden = false
            PWAPIManager.sharedInstance().get("https://graph-api.phunware.com/v1.0/devices/\(deviceId)", withParameters: nil, withCompletion: { [weak self] response, error in
                DispatchQueue.main.async {
                    self?.loadingView.isHidden = true
                    if let response = response as? [String: Any] {
                        do {
                            let jsonData = try JSONSerialization.data(withJSONObject: response, options: .prettyPrinted)
                            let deviceProfileData = try JSONDecoder().decode(DeviceProfileData.self, from: jsonData)
                            self?.deviceProfileItemArray = Array(Mirror(reflecting: deviceProfileData.data).children)
                            self?.tableView.reloadData()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            })
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? DeviceProfileViewController {
            if let selectedDeviceProfileItem = selectedDeviceProfileItem, let selectedDeviceProfileItemIndex = selectedDeviceProfileItemIndex {
                viewController.tableTitle = "\(tableTitle) \(selectedDeviceProfileItemIndex)"
                if let label = selectedDeviceProfileItem.label {
                    viewController.tableTitle = label
                }
                
                viewController.deviceProfileItemArray = Array(Mirror(reflecting: selectedDeviceProfileItem.value).children)
            }
            
        }
    }
}

extension DeviceProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRows = 0
        if let deviceProfileItemArray = deviceProfileItemArray {
            numberOfRows = deviceProfileItemArray.count
        }
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let deviceProfileItemCell = tableView.dequeueReusableCell(withIdentifier: "DeviceProfileItemCell", for: indexPath)
        
        deviceProfileItemCell.detailTextLabel?.text = nil
        deviceProfileItemCell.textLabel?.text = nil
        deviceProfileItemCell.accessoryType = .none
        
        if let deviceProfileItemArray = deviceProfileItemArray {
            let deviceProfileItem = deviceProfileItemArray[indexPath.row]
            if let label = deviceProfileItem.label {
                deviceProfileItemCell.textLabel?.text = label
            } else {
                deviceProfileItemCell.textLabel?.text = "\(tableTitle) \(indexPath.row)"
            }
            
            if let stringValue = deviceProfileItem.value as? String {
                deviceProfileItemCell.detailTextLabel?.text = stringValue
            } else if let doubleValue = deviceProfileItem.value as? Double {
                deviceProfileItemCell.detailTextLabel?.text = "\(doubleValue)"
            } else if let intValue = deviceProfileItem.value as? Int {
                deviceProfileItemCell.detailTextLabel?.text = "\(intValue)"
            } else if Mirror(reflecting: deviceProfileItem.value).children.count > 0 {
                deviceProfileItemCell.accessoryType = .disclosureIndicator
            }
        }
        
        return deviceProfileItemCell
    }
}

extension DeviceProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if let deviceProfileItemArray = deviceProfileItemArray {
            let deviceProfileItem = deviceProfileItemArray[indexPath.row]
            if !(deviceProfileItem.value is String) && !(deviceProfileItem.value is Double) && !(deviceProfileItem.value is Int) && Mirror(reflecting: deviceProfileItem.value).children.count > 0 {
                selectedDeviceProfileItem = deviceProfileItem
                selectedDeviceProfileItemIndex = indexPath.row
                return indexPath
            }
        }
        return nil
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
}
