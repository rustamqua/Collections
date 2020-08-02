//
//  TermDetailView.swift
//  Collections
//
//  Created by Rustam-Deniz on 8/2/20.
//  Copyright © 2020 Rustam-Deniz. All rights reserved.
//

import UIKit
import SnapKit

class TermDetailView: UIScrollView {
	
	lazy var definition: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.textColor = .black
		label.font = .boldSystemFont(ofSize: 20)
		return label
	}()
	
	lazy var example: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.textColor = .systemGray3
		label.font = .systemFont(ofSize: 16)
		return label
	}()
	
	lazy var author: UILabel = {
		let label = UILabel()
		label.font = .italicSystemFont(ofSize: 14)
		label.textColor = .black
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		layoutUI()
	}
	
	func layoutUI() {
		addSubview(definition)
		addSubview(example)
		addSubview(author)
		definition.snp.makeConstraints { (make) in
			make.top.equalToSuperview().offset(20)
			make.width.equalToSuperview().inset(15)
			make.centerX.equalToSuperview()
		}
		example.snp.makeConstraints { (make) in
			make.top.equalTo(definition.snp.bottom).offset(10)
			make.width.equalToSuperview().inset(15)
			make.centerX.equalToSuperview()
		}
		author.snp.makeConstraints { (make) in
			make.top.equalTo(example.snp.bottom).offset(10)
			make.width.equalToSuperview().inset(15)
			make.centerX.equalToSuperview()
		}
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
