//
//  PostData.swift
//  Hacked News
//
//  Created by Jono Jono on 14/9/2022.
//

import Foundation

struct Results: Decodable{
	let hits: [Post]
}

struct Post: Decodable, Identifiable{
	// using computed property to return the objectID, this needs to be done cuz the Json file has value objectID as their id while if we wanna use Identifiable protocols from swift, we need to have the id var
	// so to work around, we use the computed id to return the objectID
	var id: String{
		return objectID
	}
	let objectID: String
	let points: Int
	let title: String
	let url: String?
}
