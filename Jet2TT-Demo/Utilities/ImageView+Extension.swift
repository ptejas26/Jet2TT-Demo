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
    
    func downloadImage(profile: Bool = false , urlString : String, completionHandler: ((Bool?)-> ())?) {
        let url = URL(string: urlString)
        self.kf.indicatorType = .activity
        self.kf.setImage(
            with: url,
            placeholder: profile ? UIImage(named: "avatarDefault") : UIImage(named: "placeholderImage"),
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            
            guard let compHander = completionHandler else {return}
            
            switch result {
            case .failure:
                compHander(false)
            case .success(_):
                compHander(true)
            }
        }
    }
}

