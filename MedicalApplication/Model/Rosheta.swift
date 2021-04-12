//
//  Rosheta.swift
//  MedicalApplication
//
//  Created by Hala on 10/04/2021.
//

import Foundation

struct Rosheta : Codable {
    let id : Int?
    let doctor_id : String?
    let patient_id : String?
    let product_id : String?
    let record_info_id : String?
    let notes : String?
    let product : Product?
}

