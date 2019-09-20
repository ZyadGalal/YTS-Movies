//
//  GetStartedView.swift
//  ytsInCode
//
//  Created by zyad galal on 9/20/19.
//  Copyright © 2019 zyad galal. All rights reserved.
//

import UIKit

class GetStartedView: UIView {
    let getStartedlabel : UILabel = {
        let label = UILabel()
        label.text = "Welcome in YTS Movies explorer"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    let getStartedButton : UIButton = {
        let button = UIButton()
        button.setTitle("Get Started", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 21)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(red: 0, green: 0.6, blue: 1, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(GetStartedViewController.getStartedButtonClicked), for: .touchUpInside)
        return button
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
        addSubview(getStartedlabel)
        addSubview(getStartedButton)
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            getStartedlabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            getStartedlabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            getStartedlabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            getStartedlabel.trailingAnchor.constraint(equalTo:self.trailingAnchor, constant: -5),
            getStartedButton.topAnchor.constraint(equalTo: self.getStartedlabel.bottomAnchor , constant: 32),
            getStartedButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            getStartedButton.widthAnchor.constraint(equalToConstant: 250),
            getStartedButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        
    }
}
