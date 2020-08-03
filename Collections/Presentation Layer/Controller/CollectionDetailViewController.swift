//
//  CollectionDetailViewController.swift
//  Collections
//
//  Created by Rustam-Deniz on 8/4/20.
//  Copyright © 2020 Rustam-Deniz. All rights reserved.
//

import UIKit
import CoreData
import SnapKit

class CollectionDetailViewController: UIViewController {
	
	let tableView = UITableView()
	let collection: TermCollection
	
    override func viewDidLoad() {
        super.viewDidLoad()
		navigationSetup()
		tableViewSetup()
    }
	
	func navigationSetup() {
		navigationItem.largeTitleDisplayMode = .always
		navigationItem.title = collection.name
	}
	
	func tableViewSetup() {
		view.addSubview(tableView)
		tableView.snp.makeConstraints { (make) in
			make.edges.equalTo(view.safeAreaLayoutGuide)
		}
		tableView.delegate = self
		tableView.dataSource = self
	}
	
	init(collection: TermCollection) {
		self.collection = collection
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

extension CollectionDetailViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let term = collection.betweenTermAndCollection!.allObjects[indexPath.row] as! Term
		let termDetailVC = TermDetailViewController(term: term)
		navigationController?.pushViewController(termDetailVC, animated: true)
	}
}

extension CollectionDetailViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		collection.betweenTermAndCollection!.allObjects.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = TermTableViewCell()
		let term = collection.betweenTermAndCollection!.allObjects[indexPath.row] as! Term
		let codableTerm = DataConverter.fromCoreDataTerm(cdTerm: term)
		cell.configure(data: codableTerm)
		return cell
	}
}
