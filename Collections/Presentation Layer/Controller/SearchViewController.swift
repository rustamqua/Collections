//
//  ViewController.swift
//  Collections
//
//  Created by Rustam-Deniz on 7/30/20.
//  Copyright © 2020 Rustam-Deniz. All rights reserved.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {

	let searchController = UISearchController(searchResultsController: nil)
	let viewModel = TermSearchViewModel()
	let tableView = UITableView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		navigationSetup()
		searchControllerSetup()
		tableViewSetup()
	}
	
	private func tableViewSetup() {
		view.addSubview(tableView)
		tableView.snp.makeConstraints { (make) in
			make.edges.equalTo(view.safeAreaLayoutGuide)
		}
		tableView.dataSource = self
		tableView.delegate = self
		tableView.register(TermTableViewCell.self, forCellReuseIdentifier: TableCellConfigurator<TermTableViewCell, CodableTerm>.reuseId)
		viewModel.reloadCallback = {[weak self] in
			self?.tableView.reloadData()
		}
		tableView.separatorStyle = .none
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
		viewModel.termList.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let item = viewModel.termList[indexPath.row]
		let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item).reuseId)!
		item.configureCell(cell: cell)
		return cell
	}
	
}

extension SearchViewController: UITableViewDelegate {
	
}

extension SearchViewController: UISearchBarDelegate {
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		viewModel.searchRequest(for: searchBar.text!)
	}
}
