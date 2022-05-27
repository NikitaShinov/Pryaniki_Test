//
//  MainTableViewController.swift
//  Pryaniki_Test
//
//  Created by max on 27.05.2022.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var viewModel: ViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupViewModel()
        
    }
    
    private func setupUI() {
        
        title = "Основной экран"
        view.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        tableView.register(TextCell.self, forCellReuseIdentifier: TextCell.identifier)
        tableView.register(ImageCell.self, forCellReuseIdentifier: ImageCell.identifier)
        tableView.register(SelectorCell.self, forCellReuseIdentifier: SelectorCell.identifier)

    }
    
    private func setupViewModel() {
        viewModel = ViewModel()
        viewModel.getData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0, 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: TextCell.identifier, for: indexPath) as! TextCell
            cell.descriptionLabel.text = viewModel.textLabelData()
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: SelectorCell.identifier, for: indexPath) as! SelectorCell
            cell.selector.delegate = self
            cell.selector.dataSource = self
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageCell.identifier, for: indexPath) as! ImageCell
            cell.imageDescription.text = viewModel.getTextForImage(row: indexPath.row - 1)
            cell.receivedImage.loadImage(urlString: viewModel.getImageUrlFor(row: indexPath.row - 1))
            return cell
        
        default:
            return UITableViewCell()
        }
    
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 2:
            return 200
        default:
            return 100
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentAlert(title: "Внимание!",
                     message: "Инициализирован: \(viewModel.titleForRow(row: indexPath.row))",
                     buttonName: "Понятно.")
    }
    
}

extension MainTableViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        viewModel.numberOfElementsInPicker()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        viewModel.titleForElementInPicker(row: row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        presentAlert(title: "Внимание!",
                     message: "Выбранный id: \(viewModel.getPickerId(row: row))",
                     buttonName: "Понятно.")
    }
    
    
}
