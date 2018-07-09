//
//  Shipping.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 7/5/18.
//  Copyright © 2018 Gianmaria Biselli. All rights reserved.
//

import Foundation
import EasyPostApi

class Shipping{
    
    private let apiToken = "RoHBqFc08s4W3yX4rkdliw"
    
    static var userAddress = EasyPostAddress()
    
    let parcel = EasyPostParcel()
    
    init(lenght: NSNumber, width: NSNumber, height: NSNumber, weight: NSNumber) {
        parcel.length = lenght  //inches
        parcel.width = width    //inches
        parcel.height = height  //inches
        parcel.weight = width   //ounces
        
    }
    
    static func postAdress(name: String, street: String, streetTwo: String?, city: String, state: String){
        EasyPostApi.sharedInstance.setCredentials("RoHBqFc08s4W3yX4rkdliw", baseUrl: "https://api.easypost.com/v2/")
        
        
        userAddress.name = name
        userAddress.street1 = street
        userAddress.street2 = streetTwo
        userAddress.city = city
        userAddress.state = state
        
        EasyPostApi.sharedInstance.postAddress(userAddress) { (result) -> () in
            DispatchQueue.main.async {
                switch(result) {
                case .success(let value):
                    print("Successfully posted address.")
                    verifyAddress(addressId: value.id!)
                    
                case .failure(let error):
                    print("Error posting address: \((error as NSError).localizedDescription)")
                }
            }
        }
    }
    
    static func verifyAddress(addressId: String){
        EasyPostApi.sharedInstance.verifyAddress(addressId, completion: { (verifyResult) -> () in
            DispatchQueue.main.async{
                switch(verifyResult) {
                case .success(let easyPostAddress):
                    print("Successfully verified address.")
                case .failure(let error):
                    print("Error verifying address: \((error as NSError).localizedDescription)")
                }
            }
        })
    }
    
    func shippingRate(sellerAddress: EasyPostAddress, customerAddress: EasyPostAddress, package: EasyPostParcel){
        EasyPostApi.sharedInstance.postShipment(sellerAddress, fromAddress: customerAddress, parcel: package) { (result) -> () in
            DispatchQueue.main.async {
                switch(result){
                case .success(let shipment):
                    print("Successfully posted shipment.")
                    
                    if let id = shipment.id {
                        print("Shipment id: \(id)")
                    }
                    
                case .failure(let error):
                    print("Error posting shipment: \((error as NSError).localizedDescription)")
                    
                }
            }
        }
        
    }
    
    func buyShipping(shippingId: String, rateId: String){
        EasyPostApi.sharedInstance.buyShipment(shippingId, rateId: rateId, completion: { (result) -> () in
            DispatchQueue.main.async {
                if(result.isSuccess) {
                    print("Shipping request successful")
                    if let buyResponse = result.value {
                        if let postageLabel = buyResponse.postageLabel {
                            if let labelUrl = postageLabel.labelUrl {
                                print("Label url: \(labelUrl)")
                            }
                        }
                    }
                } else {
                    print("Error requesting shippping: \((result.error! as NSError).localizedDescription)")
                }
            }
        })
    }
    
    

    
    
}
