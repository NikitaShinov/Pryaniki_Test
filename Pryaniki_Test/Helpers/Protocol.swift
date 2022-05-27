//
//  Protocol.swift
//  Pryaniki_Test
//
//  Created by max on 27.05.2022.
//

import Foundation

protocol ViewModelProtocol: AnyObject {
    
    var result: ResponseData? { get }
    func getData(completion: @escaping() -> Void)
    func numberOfRows() -> Int
    func titleForRow(row: Int) -> String
    func getImageUrlFor(row: Int) -> String
    func getTextForImage(row: Int) -> String
    func numberOfElementsInPicker() -> Int
    func titleForElementInPicker(row: Int) -> String
    func getPickerId(row: Int) -> Int
    func textLabelData() -> String
    
}
