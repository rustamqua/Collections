//
//  ConfigurableCell.swift
//  Collections
//
//  Created by Rustam-Deniz on 7/31/20.
//  Copyright © 2020 Rustam-Deniz. All rights reserved.
//

import Foundation
import UIKit

protocol ConfigurableCell {
	associatedtype DataType
	func configure(data: DataType)
}

class TableCellConfigurator<E: ConfigurableCell, T>: CellConfigurator where E.DataType == T, E: UITableViewCell {
	
	static var reuseId: String {
		return String(describing: E.self)
	}
	let item: T
	func configureCell(cell: UITableViewCell) {
		if let configurableCell = cell as? E {
			configurableCell.configure(data: item)
		}
	}
	
	init(item: T) {
		self.item = item
	}
}
