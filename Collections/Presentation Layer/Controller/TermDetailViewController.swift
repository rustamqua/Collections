//
//  TermDetailViewController.swift
//  Collections
//
//  Created by Rustam-Deniz on 8/1/20.
//  Copyright © 2020 Rustam-Deniz. All rights reserved.
//

import UIKit
import CoreData
import SnapKit

class TermDetailViewController: UIViewController {
	
	let term: CodableTerm
	let mainView = TermDetailView()
	let viewModel = TermDetailViewModel()
	let cdRep = CoreDataRepository()
	var alertController: UIAlertController?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		navigationSetup()
		mainViewSetup()
		alertcontrollerSetup()
    }
	
	func navigationSetup() {
		navigationItem.title = term.word
		navigationItem.largeTitleDisplayMode = .always
	}
	
	func mainViewSetup() {
		view.backgroundColor = .white
		view.addSubview(mainView)
		mainView.snp.makeConstraints { (make) in
			make.edges.equalTo(view.safeAreaLayoutGuide)
		}
		viewModel.configureView(view: mainView, data: term)
		mainView.createCollection.addTarget(self, action: #selector(createCollection), for: .touchUpInside)
	}
	
	func alertcontrollerSetup() {
		alertController = UIAlertController(title: "Name of new collection", message: "Write down name of new collection that will be created with this term", preferredStyle: .alert)
		alertController?.addTextField(configurationHandler: { (textField) in
			textField.placeholder = "Collection Name"
		})
		let submitAction = UIAlertAction(title: "Create", style: .default) { [weak alertController] _ in
			let answer = alertController!.textFields![0]
			self.cdRep.createCollection(name: answer.text!, from: self.term)
		}
		alertController?.addAction(submitAction)
	}
	
	@objc func createCollection() {
		present(alertController!, animated: true, completion: nil)
	}
	
	override func viewDidLayoutSubviews() {
		mainView.layoutIfNeeded()
		mainView.contentSize = CGSize(width: view.bounds.width, height: mainView.author.bounds.height + mainView.example.bounds.height + mainView.definition.bounds.height + mainView.btnStack.bounds.height + 100)
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
