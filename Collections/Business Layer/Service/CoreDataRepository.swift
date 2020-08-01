//
//  CoreDataRepository.swift
//  Collections
//
//  Created by Rustam-Deniz on 8/1/20.
//  Copyright © 2020 Rustam-Deniz. All rights reserved.
//

import UIKit
import CoreData

class CoreDataRepository {

	let container = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
	let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
	
	func historyTermRequest() -> NSFetchRequest<Term> {
		let request: NSFetchRequest<Term> = Term.fetchRequest()
		request.sortDescriptors = [NSSortDescriptor(key: "createdAt", ascending: false)]
		return request
	}
	
//	func getTerms() -> [Term]? {
//		let request: NSFetchRequest<Term> = Term.fetchRequest()
//		var terms: [Term]?
//			do {
//				terms = try self.context.fetch(request)
//			} catch {
//				debugPrint(error)
//			}
//		return terms
//	}
	
//	func createTerm(from codableTerm: CodableTerm) {
//		let term = Term(context: context)
//		DataConverter.fromCodableTerm(codableTerm: codableTerm, cdTerm: term)
//		save(callback: nil)
//	}
	
	func save(callback: (() -> Void)?) {
		do {
			try context.save()
		} catch {
			debugPrint(error)
		}
		callback?()
	}
	
}
