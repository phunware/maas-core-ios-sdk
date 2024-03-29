//
//  InfoViewController.swift
//  CoreSample
//
//  Created on 4/24/17.
//  Copyright © 2017 Phunware. All rights reserved.
//

import UIKit
import PWCore
import MessageUI
import CoreLocation

class InfoViewController: UITableViewController {
        
    @IBOutlet weak var sdkVersionLabel: UILabel!
    @IBOutlet weak var applicationIdLabel: UILabel!
    @IBOutlet weak var applicationVersionLabel: UILabel!
    @IBOutlet weak var bundleIdLabel: UILabel!
    @IBOutlet weak var deviceIdLabel: UILabel!
    
    let clLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clLocationManager.requestAlwaysAuthorization()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureView()
    }
    
    func configureView() {
        sdkVersionLabel.text = PWCoreVersion
        applicationIdLabel.text = PWCore.applicationID()
        
        if let infoDictionary = Bundle.main.infoDictionary, let shortVersionString = infoDictionary["CFBundleShortVersionString"], let versionString = infoDictionary["CFBundleVersion"] {
            applicationVersionLabel.text = "v\(String(describing: shortVersionString)) (\(versionString)))"
        }
		
        bundleIdLabel.text = Bundle.main.bundleIdentifier
        deviceIdLabel.text = PWCore.deviceID()
    }
    
    @IBAction func emailLogsTapped(_ sender: UIBarButtonItem) {
        PWLogger.emailLogs()
    }
}
