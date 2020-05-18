import Foundation


/**
 CommonDataLayerEndpointBuilderEnum is a enum that stores and helps to build all endpoint used in the CommonDataLayer.

        let myDummyEndpoint = CommonDataLayerEndpointBuilderEnum.getDummy(ID: "Dummy_ID").endpoint
 */



enum CommonDataLayerEndpointBuilderEnum{
    
    //TODO: add all endpoints here
    case getDummy(ID : String)
    
    
    /**
     This property returns the String of the endpoint with all the arguments
     - Returns: String
     */
    var endpoint : String{
        switch self {
        case .getDummy(let ID):
            return "\(BankAppUtils.baseURL)\(ID)"
        default:
            return ""
        }
    }
}

