//
//  ApiServices.swift
//  MedicalApplication
//
//  Created by Hala on 10/04/2021.
//

import Foundation
import Alamofire


class ApiServices{
    
    static let instance = ApiServices()
    
    func getResponses<T: Decodable>(url: String, id: String = "", completion: @escaping(T?, Error?)-> Void){
        
        let parameters: Parameters = ["record_info_id": Int(id) ?? ""]
        let headers = ["content-type": "application/json"]
    
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON{(response) in
            
            print(Alamofire.URL.self)
            
            switch response.result{
                case .success( _):
                    guard let responseData = response.data else{
                        return
                    }
                    
                    do{
                        
                        let decoder = JSONDecoder()
                        let data = try decoder.decode(T.self, from: responseData)
                        completion(data,nil)
                        
                        print(url+id)
                        
                    }catch{
                        completion(nil,error)
                    }

                case .failure(let error):
                    completion(nil,error)
            }

            
        }
        
    }
    
}


