//
//  CDLUser.swift
//  Bank app
//
//  Created by mmalaqui on 18/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation
import UIKit
class CDLUser : BaseCDL{
    
    override init() {
        super.init()
        cacheID = "CDLUser"
    }
    
    func getUser(subscriber: CommonDataLayerSubscriber, needsToSubscribe : Bool = true, needsToNotify : Bool = true, cacheFirst : Bool = true){
        if(needsToSubscribe){
            CommonDataLayer.shared.subscribe(cacheID: cacheID, subscriber: subscriber)
        }

        if let cacheData = CommonDataLayer.shared.returnFromCache(cacheID: cacheID), cacheFirst == true{
            let response = CDLResponse.success(cacheData)
            subscriber.1(response)
            return
        }else{
            //TODO: HTTP CALL HERE, change: CommonDataLayerEndpointBuilderEnum.getDummy("1") to correct endpoint
            self.dataRequest(with: CommonDataLayerEndpointBuilderEnum.getDummy(ID: "1").endpoint, objectType: CDLUserModel.self){ (result: CDLResponse) in
                switch result {
                case .success(let modelToReturn):
                
                    if(needsToNotify){
                        CommonDataLayer.shared.saveToCacheAndNotify(cacheID: self.cacheID, model: modelToReturn)
                    }else{
                        CommonDataLayer.shared.saveToCache(cacheID: self.cacheID, model: modelToReturn)
                    }
                    let response = CDLResponse.success(modelToReturn as CommonDataLayerBaseModel)
                    subscriber.1(response)
                    break
                case .failure(let error):
                    //TODO: error handling
                    "failed with error \(error)".errorLog()
                    let response = CDLResponse<CommonDataLayerBaseModel>.failure(error)
                    subscriber.1(response)
                    break
                }
            }
           
        }
    }
}
