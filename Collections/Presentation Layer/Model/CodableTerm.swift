//
//  CodableTerm.swift
//  Collections
//
//  Created by Rustam-Deniz on 7/31/20.
//  Copyright © 2020 Rustam-Deniz. All rights reserved.
//

import Foundation

struct CodableTerm: Codable {
	let definition: String
	let thumbsUp: Int
	let author: String
	let word: String
	let example: String
}
