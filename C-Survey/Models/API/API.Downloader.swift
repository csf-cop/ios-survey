//
//  API.Downloader.swift
//  C-Survey
//
//  Created by MBA0051 on 11/6/19.
//  Copyright © 2019 Tuan.Dang. All rights reserved.
//

import Foundation
import UIKit

extension ApiManager.Downloader {
    static func image(url: String, completion: @escaping (UIImage?) -> Void) {
        API.shared().request(urlString: url) { (result) in
            switch result {
            case .failure(_):
                completion(nil)
                
            case .success(let data):
                if let data = data,
                    let image = UIImage(data: data) {
                    completion(image)
                    
                } else {
                    completion(nil)
                }
            }
        }
    }
}
