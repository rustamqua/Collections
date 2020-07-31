//
//  SearchViewViewModel.swift
//  Collections
//
//  Created by Rustam-Deniz on 7/31/20.
//  Copyright © 2020 Rustam-Deniz. All rights reserved.
//

import Foundation

class TermSearchViewModel {
	let service = TermService()
	var termList = [CellConfigurator]()

	var reloadCallback: (() -> Void)?
	
	func searchRequest(for word: String) {
		service.getTermList(for: word) {[weak self] (searchListModel) in
			self?.termList = []
			searchListModel.list.forEach { (term) in
				self?.termList.append(TableCellConfigurator<TermTableViewCell, CodableTerm>(item: term))
			}
			self?.reloadCallback?()
		}
	}
}
