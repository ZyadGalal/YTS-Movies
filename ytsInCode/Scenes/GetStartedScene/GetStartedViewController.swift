//
//  GetStartedViewController.swift
//  ytsInCode
//
//  Created by zyad galal on 9/19/19.
//  Copyright © 2019 zyad galal. All rights reserved.
//

import UIKit

class GetStartedViewController: UIViewController {
    
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
        button.addTarget(self, action: #selector(getStartedButtonClicked), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        configConstraints()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    @objc func getStartedButtonClicked(){
        let vc = ViewController() as! UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func configConstraints(){
        self.view.addSubview(getStartedlabel)
        self.view.addSubview(getStartedButton)
        NSLayoutConstraint.activate([
            getStartedlabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            getStartedlabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            getStartedlabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5),
            getStartedlabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5),
            getStartedButton.topAnchor.constraint(equalTo: self.getStartedlabel.bottomAnchor , constant: 32),
            getStartedButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            getStartedButton.widthAnchor.constraint(equalToConstant: 250),
            getStartedButton.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
}
