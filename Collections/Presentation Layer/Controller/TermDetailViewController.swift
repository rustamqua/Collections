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
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .white
		navigationItem.title = term.word
		navigationItem.largeTitleDisplayMode = .always
		view.addSubview(mainView)
		mainView.snp.makeConstraints { (make) in
			make.edges.equalTo(view.safeAreaLayoutGuide)
		}
		viewModel.configureView(view: mainView, data: term)
    }
	
	override func viewDidLayoutSubviews() {
		mainView.layoutIfNeeded()
		mainView.contentSize = CGSize(width: view.bounds.width, height: mainView.author.bounds.height + mainView.example.bounds.height + mainView.definition.bounds.height + 100)
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
