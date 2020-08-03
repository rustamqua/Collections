//
//  TermDetailViewModel.swift
//  Collections
//
//  Created by Rustam-Deniz on 8/3/20.
//  Copyright © 2020 Rustam-Deniz. All rights reserved.
//

import Foundation

class TermDetailViewModel {
	
	var collectionList: [TermCollection]
	let cdRep = CoreDataRepository()
	
	func configureView(view: TermDetailView, data: CodableTerm) {
		view.definition.text = data.definition
		view.example.text = data.example
		view.author.text = "Author: \(data.author)"
	}
	
	init() {
		let request = cdRep.getCollections()
			do {
				collectionList = try cdRep.context.fetch(request)
			} catch {
				debugPrint(error)
				collectionList = []
			}
	}
	
}
