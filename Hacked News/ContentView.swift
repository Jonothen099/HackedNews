	//
	//  ContentView.swift
	//  Hacked News
	//
	//  Created by Jono Jono on 14/9/2022.
	//

import SwiftUI

struct ContentView: View {
	// in order to use the UIKit struct in swiftUI observedObject will be used as a listener to ObservableObject broadcaster from any other swift files
	@ObservedObject var netWorkManager = NetworkManager()
	
	var body: some View {
		
		NavigationView{
				// instead of using normal list, this list gets the posts array, and the closure has a for loop that loops through the posts array and put each of the title in the Text and display it as a title
			List(netWorkManager.posts){post in
				NavigationLink(destination: DetailView(url: post.url)){
					HStack {
						Text(String(post.points))
							.padding(5)
							.foregroundColor(.secondary)
							.frame(width: 50, alignment: .leading)
						Text(post.title)
							.font(.subheadline.bold())
							.foregroundColor(.primary)
					}.padding(4)
				}
				 
			}
			.navigationTitle("Tech News")
			.listStyle(.grouped)
		}
		.onAppear {
			netWorkManager.fetchData()
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
