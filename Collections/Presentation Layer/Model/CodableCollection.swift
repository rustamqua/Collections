//
//  CodableCollection.swift
//  Collections
//
//  Created by Rustam-Deniz on 7/31/20.
//  Copyright © 2020 Rustam-Deniz. All rights reserved.
//

import Foundation

struct CodableCollection: Codable {
	let name: String
	let icon: String
	var terms: [CodableTerm]
}
