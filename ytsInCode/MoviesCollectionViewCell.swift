//
//  MoviesCollectionViewCell.swift
//  ytsInCode
//
//  Created by zyad galal on 9/16/19.
//  Copyright © 2019 zyad galal. All rights reserved.
//

import UIKit

class MoviesCollectionViewCell: UICollectionViewCell {
    let movieImage = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(movieImage)
        configImageView()
        setImageViewConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configImageView (){
        movieImage.layer.cornerRadius = 10
        movieImage.clipsToBounds = true
        movieImage.layer.borderWidth = 3
        movieImage.layer.borderColor = UIColor.white.cgColor
    }
    func setImageViewConstraint (){
        translatesAutoresizingMaskIntoConstraints = false
        movieImage.pin(to: self, with: 8)
    }
}
