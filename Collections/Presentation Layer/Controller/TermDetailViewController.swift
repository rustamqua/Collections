//
//  TermDetailViewController.swift
//  Collections
//
//  Created by Rustam-Deniz on 8/1/20.
//  Copyright © 2020 Rustam-Deniz. All rights reserved.
//

import UIKit
import CoreData

class TermDetailViewController: UIViewController {
	
	let term: CodableTerm
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .white
    }
	
	init(term: CodableTerm) {
		self.term = term
		super.init(nibName: nil, bundle: nil)
	}
	
	init(term: Term) {
		let convertedTerm = DataConverter.fromCoreDataTerm(cdTerm: term)
		self.term = convertedTerm
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
