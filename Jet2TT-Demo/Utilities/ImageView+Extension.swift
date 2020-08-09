//
//  ImageView+Extension.swift
//  Jet2TT-Demo
//
//  Created by Tejas on 09/08/20.
//  Copyright © 2020 Tejas Patelia. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func downloadImage(urlString : String) {
        let url = URL(string: urlString)
        self.kf.indicatorType = .activity
        self.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            //case .success(let value):
                //print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            case .success(_):
                print()
            }
        }
    }
}

