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
		label.textColor = .systemGray
		label.font = .systemFont(ofSize: 16)
		return label
	}()
	
	lazy var author: UILabel = {
		let label = UILabel()
		label.font = .italicSystemFont(ofSize: 14)
		label.textColor = .black
		return label
	}()
	
	lazy var addToCollection: UIButton = {
		let btn = UIButton()
		btn.backgroundColor = .systemBlue
		btn.layer.cornerRadius = 10
		btn.clipsToBounds = true
		btn.titleLabel?.textColor = .white
		btn.tintColor = .white
		btn.setTitle("Add term", for: .normal)
		btn.titleLabel?.font = .systemFont(ofSize: 12)
		btn.titleLabel?.numberOfLines = 0
		btn.titleLabel?.textAlignment = .center
		btn.setImage(UIImage(systemName: "plus"), for: .normal)
		return btn
	}()
	
	lazy var createCollection: UIButton = {
		let btn = UIButton()
		btn.backgroundColor = .systemGreen
		btn.layer.cornerRadius = 10
		btn.clipsToBounds = true
		btn.titleLabel?.textColor = .white
		btn.tintColor = .white
		btn.setTitle("Create Collection", for: .normal)
		btn.titleLabel?.font = .systemFont(ofSize: 12)
		btn.titleLabel?.numberOfLines = 0
		btn.titleLabel?.textAlignment = .center
		btn.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
		return btn
	}()
	
	lazy var btnStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [addToCollection, createCollection])
		stack.axis = .horizontal
		stack.spacing = 20
		stack.distribution = .fillEqually
		return stack
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		layoutUI()
	}
	
	func layoutUI() {
		addSubview(definition)
		addSubview(example)
		addSubview(author)
		addSubview(btnStack)
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
		btnStack.snp.makeConstraints { (make) in
			make.top.equalTo(author.snp.bottom).offset(20)
			make.centerX.equalToSuperview()
			make.width.equalTo(200)
			make.height.equalTo(40)
		}
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
