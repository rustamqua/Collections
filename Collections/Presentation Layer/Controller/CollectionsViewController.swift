//
//  CollectionsViewController.swift
//  Collections
//
//  Created by Rustam-Deniz on 7/31/20.
//  Copyright © 2020 Rustam-Deniz. All rights reserved.
//

import UIKit
import CoreData
import SnapKit

class CollectionsViewController: UIViewController {
	
	let coreDataRep = CoreDataRepository()
	let tableView = UITableView()
	lazy var frc = NSFetchedResultsController(fetchRequest: coreDataRep.getCollections(), managedObjectContext: coreDataRep.context, sectionNameKeyPath: nil, cacheName: nil)
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .white
		view.addSubview(tableView)
		navigationSetup()
		tableViewSetup()
		frcSetup()
    }
	
	func navigationSetup() {
		navigationItem.title = "Collections"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always
	}
	
	func tableViewSetup() {
		tableView.separatorStyle = .none
		tableView.snp.makeConstraints { (make) in
			make.edges.equalTo(view.safeAreaLayoutGuide)
		}
		tableView.backgroundColor = .systemGray6
		tableView.dataSource = self
		tableView.delegate = self
	}
	
	func frcSetup() {
		do {
			try frc.performFetch()
		} catch {
			debugPrint(error)
		}
	}
	
}

extension CollectionsViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return frc.fetchedObjects!.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return CollectionViewTableCell()
	}
	
}

extension CollectionsViewController: UITableViewDelegate {
	
}
