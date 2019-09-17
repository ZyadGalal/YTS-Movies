//
//  UIView + ext.swift
//  ytsInCode
//
//  Created by zyad galal on 9/16/19.
//  Copyright © 2019 zyad galal. All rights reserved.
//

import UIKit

extension UIView{
    func pin (to superView : UIView , with padding : CGFloat){
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.topAnchor,constant: padding),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor,constant: -padding),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor,constant: padding),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor,constant: -padding)
            ])
    }
}
