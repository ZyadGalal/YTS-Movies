//
//  GetStartedViewController.swift
//  ytsInCode
//
//  Created by zyad galal on 9/19/19.
//  Copyright © 2019 zyad galal. All rights reserved.
//

import UIKit

class GetStartedViewController: UIViewController {
    
    private lazy var mainView: GetStartedView = {
        return GetStartedView(frame: view.frame)
    }()
    override func loadView() {
        super.loadView()
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    @objc func getStartedButtonClicked(){
        let vc = ViewController() as! UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
