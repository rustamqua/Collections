//
//  ViewController.swift
//  Collections
//
//  Created by Rustam-Deniz on 7/30/20.
//  Copyright © 2020 Rustam-Deniz. All rights reserved.
//

import UIKit
import SnapKit
import CoreData

class SearchViewController: UIViewController {

	let searchController = UISearchController(searchResultsController: nil)
	let viewModel = TermSearchViewModel()
	let tableView = UITableView()
	let coreDataRep = CoreDataRepository()
	lazy var fetchedResultsController: NSFetchedResultsController<Term> = NSFetchedResultsController(fetchRequest: coreDataRep.historyTermRequest(), managedObjectContext: coreDataRep.context, sectionNameKeyPath: nil, cacheName: nil)
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		navigationSetup()
		searchControllerSetup()
		tableViewSetup()
		frcSetup()
	}
	
	private func frcSetup() {
		fetchedResultsController.delegate = self
		do {
			try fetchedResultsController.performFetch()
		} catch {
			debugPrint(error)
		}
	}
	
	private func tableViewSetup() {
		view.addSubview(tableView)
		tableView.snp.makeConstraints { (make) in
			make.edges.equalTo(view.safeAreaLayoutGuide)
		}
		tableView.dataSource = self
		tableView.delegate = self
		tableView.register(TermTableViewCell.self, forCellReuseIdentifier: TermCell.reuseId)
		viewModel.reloadCallback = {[weak self] in
			self?.tableView.reloadData()
		}
		tableView.separatorStyle = .none
		tableView.backgroundColor = .systemGray6
	}
	
	private func navigationSetup() {
		navigationItem.title = "Search"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.largeTitleDisplayMode = .always
		navigationItem.searchController = searchController
	}
	
	private func searchControllerSetup() {
		searchController.searchBar.delegate = self
		searchController.obscuresBackgroundDuringPresentation = false
		searchController.searchBar.placeholder = "Input text..."
	}
	
}

extension SearchViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.showingHistory ? fetchedResultsController.fetchedObjects!.count : viewModel.termList.count
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		1
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return viewModel.showingHistory ? "History" : ""
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		var item: TermCell
		let cell = tableView.dequeueReusableCell(withIdentifier: TermCell.reuseId)!
		if viewModel.showingHistory {
			let cdItem = fetchedResultsController.fetchedObjects![indexPath.row]
			let term = DataConverter.fromCoreDataTerm(cdTerm: cdItem)
			item = TermCell(item: term)
		} else {
			item = viewModel.termList[indexPath.row] as! TermCell
		}
		item.configureCell(cell: cell)
		return cell
	}
	
}

extension SearchViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if !viewModel.showingHistory, let termCell = viewModel.termList[indexPath.row] as? TermCell {
			let detailVC = TermDetailViewController(term: termCell.item)
			if let termCell = viewModel.termList[indexPath.row] as? TermCell {
				coreDataRep.createTerm(from:  termCell.item, results: fetchedResultsController.fetchedObjects!)
			}
			self.navigationController?.pushViewController(detailVC, animated: true)
		}
	}
	
}

extension SearchViewController: UISearchBarDelegate {
	
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		viewModel.showingHistory = false
		viewModel.searchRequest(for: searchBar.text!)
	}
	
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		if searchText.isEmpty {
			viewModel.showingHistory = true
			tableView.reloadData()
		}
	}
	
	func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
		viewModel.showingHistory = true
		tableView.reloadData()
	}
	
}

extension SearchViewController: NSFetchedResultsControllerDelegate {
	
	func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
		if type == .insert {
			tableView.reloadData()
		}
	}
	
}
