//
//  DataConverter.swift
//  Collections
//
//  Created by Rustam-Deniz on 8/2/20.
//  Copyright © 2020 Rustam-Deniz. All rights reserved.
//

import Foundation
import UIKit

class DataConverter {
		
	static func fromCodableTerm(codableTerm: CodableTerm, cdTerm: Term) {
		cdTerm.thumbsUp = Int32(codableTerm.thumbsUp)
		cdTerm.author = codableTerm.author
		cdTerm.defid = Int32(codableTerm.defid)
		cdTerm.definition = codableTerm.definition
		cdTerm.example = codableTerm.example
		cdTerm.word = codableTerm.word
		cdTerm.createdAt = Date()
		cdTerm.showingInHistory = true
	}
	
	static func fromCoreDataTerm(cdTerm: Term) -> CodableTerm {
		return CodableTerm(definition: cdTerm.definition!, thumbsUp: Int(cdTerm.thumbsUp), author: cdTerm.author!, word: cdTerm.word!, example: cdTerm.example!, defid: Int(cdTerm.defid))
	}
}
