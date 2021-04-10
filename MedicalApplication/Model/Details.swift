//
//  Details.swift
//  MedicalApplication
//
//  Created by Hala on 10/04/2021.
//

import Foundation

struct Details : Codable {
    let id : Int?
    let patient_name : String?
    let image_profile : String?
    let doctorName : String?
    let image_doctor : String?
    let record_info_id : String?
    let rosheta : [Rosheta]?
}
