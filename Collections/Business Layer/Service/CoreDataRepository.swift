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
	
	func createTerm(from codableTerm: CodableTerm, results: [Term]) {
		let noCopiesCheck = results.filter {$0.defid == codableTerm.defid}
		if noCopiesCheck.isEmpty {
			let term = Term(context: context)
			DataConverter.fromCodableTerm(codableTerm: codableTerm, cdTerm: term)
			save(callback: nil)
		} else {
			noCopiesCheck[0].createdAt = Date()
			save(callback: nil)
		}
	}
	
	func save(callback: (() -> Void)?) {
		do {
			try context.save()
		} catch {
			debugPrint(error)
		}
		callback?()
	}
	
}
