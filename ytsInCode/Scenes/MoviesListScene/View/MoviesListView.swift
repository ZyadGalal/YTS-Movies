//
//  MoviesListView.swift
//  ytsInCode
//
//  Created by zyad galal on 9/20/19.
//  Copyright © 2019 zyad galal. All rights reserved.
//

import UIKit

class MoviesListView: UIView {

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        collection.isScrollEnabled = true
        return collection
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayoutUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupLayoutUI(){
        addSubView()
        setupConstraints()
    }
    func addSubView(){
        addSubview(collectionView)
    }
    func setupConstraints(){
        collectionView.pin(to: self, with: 0)
    }
    
}
