//
//  CellConfigurator.swift
//  Collections
//
//  Created by Rustam-Deniz on 7/31/20.
//  Copyright © 2020 Rustam-Deniz. All rights reserved.
//

import Foundation
import UIKit

protocol CellConfigurator {
	static var reuseId: String { get }
	func configureCell(cell: UITableViewCell)
}
