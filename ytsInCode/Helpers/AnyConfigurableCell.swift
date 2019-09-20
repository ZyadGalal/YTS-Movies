//
//  File.swift
//  ytsInCode
//
//  Created by zyad galal on 9/20/19.
//  Copyright © 2019 zyad galal. All rights reserved.
//

import Foundation

protocol ConfigurableCell {
    associatedtype Model
    func configure(model: Model)
}

class AnyConfigurableCell<Model>: ConfigurableCell {
    
    private let _configure: (Model) -> ()
    
    init<C: ConfigurableCell>(_ cell: C) where C.Model == Model {
        _configure = cell.configure
    }
    
    func configure(model: Model) {
        _configure(model)
    }
}
