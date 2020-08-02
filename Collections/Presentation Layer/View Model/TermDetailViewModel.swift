//
//  TermDetailViewModel.swift
//  Collections
//
//  Created by Rustam-Deniz on 8/3/20.
//  Copyright © 2020 Rustam-Deniz. All rights reserved.
//

import Foundation

class TermDetailViewModel {
	
	func configureView(view: TermDetailView, data: CodableTerm) {
		view.definition.text = data.definition
		view.example.text = data.example
		view.author.text = "Author: \(data.author)"
	}
	
}
