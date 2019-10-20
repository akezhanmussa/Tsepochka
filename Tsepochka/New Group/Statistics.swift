//
//  Statistics.swift
//  GraphTest
//
//  Created by talgat on 23.12.17.
//  Copyright © 2017 Akezhan. All rights reserved.
//

import Foundation
import Firebase
import Alamofire
import Kingfisher
import FirebaseDatabase

struct Statistics{
    
    
    // Fectching the elements via the Firebase of the specific child
    static func fetchElement(child: String, callback: @escaping ([[String:Any]]) -> ()){
        let ref = Database.database().reference()
        ref.child(child).observe(.value, with: { (snapshot) in
            
            let post = snapshot.value as? [[String:Any]]
            
            callback(post!)
        })
    }
    
    static func openImage(image:String) -> UIImage{
        
        let testImage = UIImageView()
        let url = URL(string: image)
        testImage.kf.setImage(with: url)
        return testImage.image!

    }
    
    // Fetching the detailed statistics from the specific coin
    static func fetchCoin(coin: String, callback: @escaping([Double]?, [Double]?,[String]?, String?) -> Void){
        
        Alamofire.request(coin).responseJSON{ response in
            
            if response.result.isSuccess == true{
                let dateFormatter = DateFormatter()
                
                dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
                dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
                dateFormatter.timeZone = TimeZone.current
                
                guard let json = response.result.value as? [String:Any], let elements = json["price"] as? [[Double]], let moreElements = json["market_cap"] as? [[Double]] else {
                    callback(nil,nil,nil,"Sorry, there is no still information about this cryptocurrency")
                    return
                }
                
                var dataPoints = [String]()
                var values = [Double]()
                var marketPrice = [Double]()
                
                for element in elements{
                    let date = NSDate(timeIntervalSince1970: TimeInterval(element[0]/1000))
                    dataPoints.append(dateFormatter.string(from: date as Date))
                    values.append(element[1])
                }

                for element in moreElements{
                    marketPrice.append(element[1])
                }
                callback(marketPrice, values,dataPoints,nil)
            }
            callback(nil, nil,nil,"Sorry, there is no still information about this cryptocurrency")
        }
        
    }
    
    //Method for different time
    static func changeTime(coinName:String,data:String, callback: @escaping([Double],[String],[Double])-> Void){
        
        var value = [Double]()
        var dataPoint = [String]()
        var marketPric = [Double]()
   
        Statistics.fetchCoin(coin: "http://coincap.io/history/" + data + "/" + coinName + "/"){ (marketPrice, values,dataPoints,error) in
            
            if marketPrice?.count == 0 || values?.count == 0 || values == nil {
                return
            }
            
            guard let values = values, let dataPoints = dataPoints else{
                return
            }
            
            value = values
            dataPoint = dataPoints
            marketPric = marketPrice!
            
            callback(value,dataPoint,marketPric)
        }
    }
    
    
}



