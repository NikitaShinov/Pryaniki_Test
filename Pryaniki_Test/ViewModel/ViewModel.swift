//
//  ViewModel.swift
//  Pryaniki_Test
//
//  Created by max on 27.05.2022.
//

import Foundation

class ViewModel: ViewModelProtocol {
    
    var result: ResponseData?
    
    func getData(completion: @escaping () -> Void) {
        NetworkManager.fetchData { [weak self] result in
            self?.result = result
            completion()
        }
    }
    
    func numberOfRows() -> Int {
        guard let numberOfRows = result?.view.count else { return 0 }
        return numberOfRows
    }
    
    func titleForRow(row: Int) -> String {
        guard let titleForRow = result?.view[row] else { return Constants.invalidText }
        return titleForRow
    }
    
    func getImageUrlFor(row: Int) -> String {
        guard let imageUrl = result?.data[row].data.url else { return Constants.crashedImage }
        return imageUrl
    }
    
    func getTextForImage(row: Int) -> String {
        guard let text = result?.data[row].data.text else { return Constants.invalidText }
        return text
    }
    
    func numberOfElementsInPicker() -> Int {
        guard let numberOfItems = result?.data.last?.data.variants?.count else { return 0 }
        return numberOfItems
    }
    
    func titleForElementInPicker(row: Int) -> String {
        guard let title = result?.data.last?.data.variants?[row].text else { return Constants.invalidText }
        return title
    }
    
    func getPickerId(row: Int) -> Int {
        guard let id = result?.data.last?.data.variants?[row].id else { return 0 }
        return id
    }
    
    func textLabelData() -> String {
        guard let text = result?.data.first?.data.text else { return Constants.invalidText }
        return text
    }
    
}
