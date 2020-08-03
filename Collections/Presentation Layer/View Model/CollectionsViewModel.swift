//
//  CollectionsViewModel.swift
//  Collections
//
//  Created by Rustam-Deniz on 8/4/20.
//  Copyright © 2020 Rustam-Deniz. All rights reserved.
//

import Foundation
import UIKit

class CollectionsViewModel {
	
	func configureView(view: CollectionViewTableCell, data: TermCollection) {
		view.mainTitle.text = data.name!
		view.secondaryTitle.text = "Number of terms: \(data.betweenTermAndCollection!.count)"
	}
	
}
