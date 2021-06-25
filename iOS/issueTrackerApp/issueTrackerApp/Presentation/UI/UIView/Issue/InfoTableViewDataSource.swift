//
//  InfoTableViewDataSource.swift
//  issueTrackerApp
//
//  Created by zombietux on 2021/06/23.
//

import UIKit

class InfoTableViewDataSource: NSObject {
    internal var dataOrganizer: ArrayDataSourceOrganizer<Info>
    internal var viewModelCache: [IndexPath : InfoCell.ViewModel] = [:]
    
    init(infoList: [Info]) {
        dataOrganizer = ArrayDataSourceOrganizer(items: infoList)
        super.init()
    }
    
    func updateDataOrganizer(_ infoList: [Info]) {
        self.dataOrganizer.items = infoList
    }
}

private extension InfoTableViewDataSource {
    struct DataOrganizer {
        private var infoList: [Info]
        private var kind: String
        
        var rowsCount: Int {
            return infoList.count
        }
        
        subscript(indexPath: IndexPath) -> Info {
            return infoList[indexPath.row]
        }
    }
}

extension InfoTableViewDataSource: ArrayTableViewDataSource {
    func viewModel(for value: ModelType) -> InfoCell.ViewModel {
        return InfoCell.ViewModel(info: value)
    }
    
    func configure(cell: InfoCell, with viewModel: InfoCell.ViewModel) {
        cell.viewModel = viewModel
    }
}

extension InfoTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cell(from: tableView, for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "작성자"
    }
}
