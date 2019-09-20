//
//  CollectionViewExtensions.swift
//  ytsInCode
//
//  Created by zyad galal on 9/20/19.
//  Copyright © 2019 zyad galal. All rights reserved.
//

import UIKit

extension UICollectionView {
    func register<Cell: UICollectionViewCell>(_ cellType: Cell.Type) {
        register(Cell.self, forCellWithReuseIdentifier: String(describing: Cell.self))
    }
    
    func dequeueCell<Cell: UICollectionViewCell>(for indexPath: IndexPath) -> Cell {
        return self.dequeueReusableCell(withReuseIdentifier: String(describing: Cell.self), for: indexPath) as! Cell
    }
}
