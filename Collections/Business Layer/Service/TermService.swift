//
//  termService.swift
//  Collections
//
//  Created by Rustam-Deniz on 7/31/20.
//  Copyright © 2020 Rustam-Deniz. All rights reserved.
//

import Foundation
import Alamofire

protocol TermServiceable {
	func getTermList(for term: String, callBack: @escaping ((_: SearchListTerms) -> Void))
}

class TermService: TermServiceable {
	func getTermList(for term: String, callBack: @escaping ((_: SearchListTerms) -> Void)) {
		let params: Parameters = [
			"term": term
		]
		AF.request("\(API.baseURL)\(API.definePostfix)", method: .get, parameters: params).response { (res) in
			switch res.result {
			case .success(let data):
				let decoder = JSONDecoder()
				decoder.keyDecodingStrategy = .convertFromSnakeCase
				do {
					let list = try decoder.decode(SearchListTerms.self, from: data!)
					callBack(list)
				} catch {
					debugPrint(error)
				}
			case .failure(let error):
				debugPrint(error)
			}
		}
	}
}
