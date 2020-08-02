//
//  CollectionViewTableCell.swift
//  Collections
//
//  Created by Rustam-Deniz on 8/3/20.
//  Copyright © 2020 Rustam-Deniz. All rights reserved.
//

import UIKit
import SnapKit

class CollectionViewTableCell: UITableViewCell {

	lazy var mainStack: UIStackView = {
		let stack = UIStackView()
		stack.axis = .horizontal
		stack.alignment = .center
		stack.spacing = 25
		stack.distribution = .fill
		return stack
	}()
	
	lazy var infoStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [mainTitle, secondaryTitle])
		stack.axis = .vertical
		return stack
	}()
	
	lazy var iconImage: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(systemName: "book.circle.fill")
		imageView.contentMode = .scaleAspectFill
		return imageView
	}()
	
	lazy var mainTitle: UILabel = {
		let label = UILabel()
		label.font = .boldSystemFont(ofSize: 18)
		label.text = "test"
		return label
	}()
	
	lazy var secondaryTitle: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 14)
		label.textColor = .systemGray
		label.text = "test"
		return label
	}()
	
	lazy var mainView: UIView = {
		let view = UIView()
		view.backgroundColor = .white
		view.layer.cornerRadius = 20
		view.clipsToBounds = true
		return view
	}()
	
	func layoutUI() {
		addSubview(mainView)
		mainView.addSubview(mainStack)
		mainStack.addArrangedSubview(iconImage)
		mainStack.addArrangedSubview(infoStack)
		mainView.snp.makeConstraints { (make) in
			make.edges.equalToSuperview().inset(20)
			make.height.greaterThanOrEqualTo(100)
		}
		mainStack.snp.makeConstraints { (make) in
			make.top.right.bottom.equalToSuperview()
			make.left.equalToSuperview().offset(30)
		}
		iconImage.snp.makeConstraints { (make) in
			make.width.equalTo(60)
		}
		backgroundColor = .systemGray6
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		layoutUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
