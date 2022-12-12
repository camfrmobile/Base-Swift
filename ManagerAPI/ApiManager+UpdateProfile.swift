import Foundation
import Alamofire
import SwiftyJSON

extension ApiManager {
    func updateProfile(userProfile: Profile, success: @escaping () -> Void, failure: @escaping (String) -> Void){
        
        let params = [
            "name": userProfile.name,
            "phone": userProfile.phone,
            "address": userProfile.address,
            "avatar": userProfile.avatar
            
        ]
        
        Alamofire.request(ApiNameManager.shared.returnUrl(ApiNameManager.shared.updateProfile), method: .put, parameters: params, encoding: JSONEncoding.default, headers: getHeaders()).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let code = json["code"].intValue
                if code == 0 {
                    success()
                }else{
                    let message = json["message"].stringValue
                    failure(message)
                }
            case .failure(let error):
                failure(error.localizedDescription)
            }
        }
    }
}
