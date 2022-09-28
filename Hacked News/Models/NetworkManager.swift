	//
	//  NetworkManager.swift
	//  Hacked News
	//
	//  Created by Jono Jono on 14/9/2022.
	//

import Foundation
class NetworkManager: ObservableObject{
	
	
	@Published var posts = [Post]()

	func fetchData(){
		if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page"){
			let session = URLSession(configuration: .default)
			let task = session.dataTask(with: url) { [self] data, response, error in
				if error == nil {
					let decoder = JSONDecoder()
					if let safeData = data{
						do {
							// decoding the safedata into Results Struct/array
							let results = try decoder.decode(Results.self, from: safeData)
							// DispatchQueue.main.async is a method to allow ur device to process the data fetching, otherwise you will get an error or ur app will crashed
							// usually this is being done when we re tapping into the @Published var
							DispatchQueue.main.async {
									// getting the decoded data that stored in the Results struct into posts array so that it can be used in ContentView.swift
								self.posts = results.hits
							}
							
						}catch{
							print(error)
						}
						
					}
				}
			}
			task.resume()

		}
	}
}
