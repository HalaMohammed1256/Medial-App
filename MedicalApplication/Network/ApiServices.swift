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
    
    func getResponses<T: Decodable>(url: String, id: String, completion: @escaping(T?, Error?)-> Void){
        
        
        Alamofire.request(url, method: .get, encoding: URLEncoding.default).responseJSON{(response) in
            
            switch response.result{
                case .success( _):
                    guard let responseData = response.data else{
                        return
                    }
                    
                    do{
                        
                        let decoder = JSONDecoder()
                        let data = try decoder.decode(T.self, from: responseData)
                        completion(data,nil)
                        
                    }catch{
                        completion(nil,error)
                    }
                    
                case .failure(let error):
                    completion(nil,error)
            }
            
            
        }
        
    }
    
}



