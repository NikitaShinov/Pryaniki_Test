//
//  CustomImageView.swift
//  Pryaniki_Test
//
//  Created by max on 27.05.2022.
//

import UIKit

var cachedImage = [String: UIImage]()

class CustomImageView: UIImageView {
    
    func loadImage(urlString: String) {
        
        self.image = nil
        
        if let cache = cachedImage[urlString] {
            self.image = cache
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error  {
                print ("Error: \(error.localizedDescription)")
                return
            }
            guard let data = data else { return }
            
            let photo = UIImage(data: data)
            
            cachedImage[url.absoluteString] = photo
            
            DispatchQueue.main.async {
                self.image = photo
            }
        }.resume()
    }
}
