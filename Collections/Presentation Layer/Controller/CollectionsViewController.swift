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
	let viewModel = CollectionsViewModel()
	var alertController: UIAlertController?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .white
		view.addSubview(tableView)
		navigationSetup()
		tableViewSetup()
		frcSetup()
		alertcontrollerSetup()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		do {
			try self.frc.performFetch()
		} catch {
			debugPrint(error)
		}
		tableView.reloadData()
	}
	
	func navigationSetup() {
		navigationItem.title = "Collections"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always
		let btn = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(addCollection))
		navigationItem.rightBarButtonItem = btn
	}
	
	func alertcontrollerSetup() {
		alertController = UIAlertController(title: "Name of new collection", message: "Write down name of new collection", preferredStyle: .alert)
		alertController?.addTextField(configurationHandler: { (textField) in
			textField.placeholder = "Collection Name"
		})
		let submitAction = UIAlertAction(title: "Create", style: .default) { [weak alertController] _ in
			let answer = alertController!.textFields![0]
			self.coreDataRep.createEmptyCollection(name: answer.text!)
		}
		let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
		alertController?.addAction(submitAction)
		alertController?.addAction(cancelAction)
	}
	
	@objc func addCollection() {
		present(alertController!, animated: true, completion: nil)
	}
	
	func tableViewSetup() {
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
		frc.delegate = self
	}
	
}

extension CollectionsViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return frc.fetchedObjects!.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = CollectionViewTableCell()
		viewModel.configureView(view: cell, data: frc.fetchedObjects![indexPath.row])
		return cell
	}
	
}

extension CollectionsViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let collectionDetailVC = CollectionDetailViewController(collection: frc.fetchedObjects![indexPath.row])
		navigationController?.pushViewController(collectionDetailVC, animated: true)
		
	}
}

extension CollectionsViewController: NSFetchedResultsControllerDelegate {
		
	func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
		if type == .insert {
			tableView.reloadData()
		}
	}
	
}
