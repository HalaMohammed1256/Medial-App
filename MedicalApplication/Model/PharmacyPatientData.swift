//
//  DataModel.swift
//  MedicalApplication
//
//  Created by Hala on 10/04/2021.
//

import Foundation

struct PharmacyPatientData : Codable {
    let status_code : Int?
    let message : String?
    let details : Details?
}
