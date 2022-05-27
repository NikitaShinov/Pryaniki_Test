//
//  Model.swift
//  Pryaniki_Test
//
//  Created by max on 27.05.2022.
//

import Foundation

struct ResponseData: Codable {
    let data: [Datum]
    let view: [String]
}

struct Datum: Codable {
    let name: String
    let data: DataClass
}

struct DataClass: Codable {
    let text: String?
    let url: String?
    let selectedId: Int?
    let variants: [Variant]?
}

struct Variant: Codable {
    let id: Int
    let text: String
}
