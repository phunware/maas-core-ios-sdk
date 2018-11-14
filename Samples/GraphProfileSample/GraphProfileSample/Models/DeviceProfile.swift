//
//  DeviceProfile.swift
//  GraphProfileSample
//
//  Created by on 11/8/18.
//  Copyright © 2018 Phunware. All rights reserved.
//

import Foundation

let SampleDeviceProfileData =
"""
{
    "data": {
        "operatingSystemVersion": "7.0",
        "ifa": "2f215312-78cb-4768-baac-44ab2db42112",
        "ifaType": "md5",
        "segment": {
            "interest": [],
            "lifeStage": [],
            "consumption": [{
                "name": "MobileApps",
                "id": "Consumption_M-004"
            }],
            "intent": [{
                "name": "Automotive",
                "id": "Intent_P-001"
            }],
            "demographic": []
        },
        "location": {
            "country": [{
                "name": "US",
                "state": [{
                    "city": [{
                        "name": "Austin",
                        "id": "Austin_TX_US",
                        "geoCoordinates": [{
                            "latitude": 33.112133,
                            "name": "9muf1s9y",
                            "longitude": -114.83612,
                            "dates": [20180902, 20180901]
                        }, {
                            "latitude": 33.121315,
                            "name": "9mud1s9z",
                            "longitude": -114.67682,
                            "dates": [20180902, 20180901]
                        }]
                    }],
                    "name": "TX",
                    "id": "TX_US"
                }],
                "postalCode": [{
                    "id": "78757_US",
                    "postalCode": "78757"
                }]
            }]
        },
        "model": "Android 7.0",
        "operatingSystem": "android",
        "mobileApplication": [{
            "phunwareAppId": "154",
            "bundleStoreId": "com.phunware.samplef",
            "id": "com.phunware.samplef",
            "operatingSystem": "android"
        }],
        "manufacturer": "Generic"
    }
}
"""

struct DeviceProfileData: Decodable {
    
    let data: DeviceProfile
    
    struct DeviceProfile: Decodable {
        
        let operatingSystemVersion: String?
        let ifa: String?
        let ifaType: String?
        let segment: Segment
        let location: Location
        let model: String?
        let operatingSystem: String?
        let mobileApplication: [MobileApplication]
        let manufacturer: String?
        
        struct Segment: Decodable {
            
            let interest: [SegmentData]
            let lifeStage: [SegmentData]
            let consumption: [SegmentData]
            let intent: [SegmentData]
            let demographic: [SegmentData]
            
            struct SegmentData: Decodable {
                
                let name: String?
                let id: String?
            }
        }
        
        struct Location: Decodable {
            
            let country: [Country]
            
            struct Country: Decodable {
                
                let name: String?
                let state: [State]
                let postalCode: [PostalCode]
                
                struct State: Decodable {
                    
                    let city: [City]
                    let name: String?
                    let id: String?
                    
                    struct City: Decodable {
                        
                        let name: String?
                        let id: String?
                        let geoCoordinates: [GeoCoordinates]
                        
                        struct GeoCoordinates: Decodable {
                            
                            let latitude: Double?
                            let name: String?
                            let longitude: Double?
                            let dates: [Int]
                        }
                    }
                }
                
                struct PostalCode: Decodable {
                    
                    let id: String?
                    let postalCode: String?
                }
            }
        }
        
        struct MobileApplication: Decodable {
            
            let phunwareAppId: String?
            let bundleStoreId: String?
            let id: String?
            let operatingSystem: String?
        }
    }
}
