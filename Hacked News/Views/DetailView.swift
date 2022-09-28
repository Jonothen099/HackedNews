	//
	//  DetailView.swift
	//  Hacked News
	//
	//  Created by Jono Jono on 14/9/2022.
	//

import SwiftUI

struct DetailView: View {
	let url: String?
	
	var body: some View {
		WebView(urlString: url)
		
	}
}

struct DetailView_Previews: PreviewProvider {
	static var previews: some View {
		DetailView(url: "https://www.google.com")
	}
}

