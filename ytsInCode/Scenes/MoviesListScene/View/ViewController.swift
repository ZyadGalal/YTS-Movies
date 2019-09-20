//
//  ViewController.swift
//  ytsInCode
//
//  Created by zyad galal on 9/16/19.
//  Copyright © 2019 zyad galal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var mainView: MoviesListView = {
        return MoviesListView(frame: view.frame)
    }()
    var presenter : MoviesPresenter!
    var moviesNumber : Int = 0
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "YTS Movies"
        self.view.backgroundColor = .black
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem.setHidesBackButton(true, animated: false)
        configreCollectionView()
        presenter = MoviesPresenter(view: self)
        presenter.viewDidLoad()
    }
    
    func configreCollectionView ()
    {
        view.addSubview(mainView.collectionView)
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
        mainView.collectionView.register(MoviesCollectionViewCell.self)
    }
    deinit {
        print("i do it")
    }
}

extension ViewController : UICollectionViewDataSource , UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesNumber
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(for: indexPath) as MoviesCollectionViewCell
        presenter.config(cell: cell, at: indexPath.row)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/2, height: 250)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(MovieDetailsViewController(), animated: true)
    }
    
}

extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}
extension ViewController : MoviesView{
    func getMoviesNumber(movies: Int) {
        moviesNumber = movies
    }
    func fetchDataSuccess() {
        mainView.collectionView.reloadData()
    }
    func fetchDataFailed(message: String) {
        print(message)
    }
}

