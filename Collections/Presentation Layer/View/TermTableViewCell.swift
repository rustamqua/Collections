//
//  termTableViewCell.swift
//  Collections
//
//  Created by Rustam-Deniz on 7/31/20.
//  Copyright © 2020 Rustam-Deniz. All rights reserved.
//

import UIKit
import SnapKit

class TermTableViewCell: UITableViewCell, ConfigurableCell {

	typealias DataType = CodableTerm
	
	lazy var term: UILabel = {
		let label = UILabel()
		label.font = .boldSystemFont(ofSize: 20)
		return label
	}()
	
	lazy var definition: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 16)
		label.textColor = .lightGray
		label.numberOfLines = 10
		return label
	}()
	
	lazy var rating: UILabel = {
		let label = UILabel()
		label.font = .boldSystemFont(ofSize: 15)
		label.textAlignment = .center
		return label
	}()
	
	lazy var ratingStack: UIStackView = {
		let stack = UIStackView()
		stack.addArrangedSubview(rating)
		stack.addArrangedSubview(thumUpImageView)
		stack.alignment = .center
		stack.distribution = .fill
		stack.axis = .horizontal
		stack.spacing = 0
		return stack
	}()
	
	lazy var thumUpImageView: UIImageView = {
		let img = UIImage(systemName: "hand.thumbsup")
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFit
		imageView.tintColor = .systemGreen
		imageView.image = img
		return imageView
	}()
	
	lazy var defAndRatingStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [definition, ratingStack])
		stack.axis = .horizontal
		stack.alignment = .center
		stack.distribution = .fill
		stack.spacing = 10
		return stack
	}()
	
	func layoutUI() {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.alignment = .leading
		stackView.distribution = .fill
		let view = UIView()
		view.addSubview(stackView)
		view.layer.cornerRadius = 20
		view.clipsToBounds = true
		view.backgroundColor = .white
		addSubview(view)
		view.snp.makeConstraints { (make) in
			make.bottom.equalToSuperview().offset(-20)
			make.top.equalToSuperview().offset(20)
			make.height.greaterThanOrEqualTo(150)
			make.left.equalToSuperview().offset(15)
			make.right.equalToSuperview().offset(-15)

		}
		stackView.snp.makeConstraints { (make) in
			make.edges.equalToSuperview().inset(10)
		}
		stackView.addArrangedSubview(term)
		stackView.addArrangedSubview(defAndRatingStack)
		thumUpImageView.snp.makeConstraints { (make) in
			make.width.equalTo(30)
		}
		definition.snp.makeConstraints { (make) in
			make.width.greaterThanOrEqualTo(280)
		}
		ratingStack.snp.makeConstraints { (make) in
			make.width.equalTo(70)
		}
		defAndRatingStack.snp.makeConstraints { (make) in
			make.left.equalToSuperview()
		}
		self.backgroundColor = .systemGray6
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		layoutUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configure(data: CodableTerm) {
		rating.text = String(data.thumbsUp)
		term.text = data.word
		definition.text = data.definition
	}

}
