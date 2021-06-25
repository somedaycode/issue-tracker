//
//  MoreInfoTableViewDataSource.swift
//  issueTrackerApp
//
//  Created by zombietux on 2021/06/12.
//

import UIKit

class MoreInfoTableViewDataSource: NSObject {
    internal var dataOrganizer: ArrayDataSourceOrganizer<MoreInfoType>
    internal var viewModelCache: [IndexPath : MoreInfoCell.ViewModel] = [:]
    
    init(moreInfos: [MoreInfoType]) {
        dataOrganizer = ArrayDataSourceOrganizer(items: moreInfos)
        super.init()
    }
}

private extension MoreInfoTableViewDataSource {
    struct DataOrganizer {
        let moreInfos: [MoreInfoType]
        
        var rowsCount: Int {
            return moreInfos.count
        }
        
        subscript(indexPath: IndexPath) -> MoreInfoType {
            return moreInfos[indexPath.row]
        }
    }
}

extension MoreInfoTableViewDataSource: ArrayTableViewDataSource {
    func viewModel(for value: ModelType) -> MoreInfoCell.ViewModel {
        return MoreInfoCell.ViewModel(moreInfo: value as! MoreInfo)
    }
    
    func configure(cell: MoreInfoCell, with viewModel: MoreInfoCell.ViewModel) {
        cell.viewModel = viewModel
    }
}

extension MoreInfoTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cell(from: tableView, for: indexPath)
    }
}

