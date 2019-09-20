//
//  ViewController.swift
//  ytsInCode
//
//  Created by zyad galal on 9/16/19.
//  Copyright © 2019 zyad galal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var presenter : MoviesPresenter!
    var moviesNumber : Int = 0
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        collection.isScrollEnabled = true
        return collection
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "YTS Movies"
        self.view.backgroundColor = .black
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem.setHidesBackButton(true, animated: false)
        configreCollectionView()
        presenter = MoviesPresenter(delegate: self)
        presenter.viewDidLoad()
    }
    
    func configreCollectionView ()
    {
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.pin(to: view, with: 0)

        collectionView.register(MoviesCollectionViewCell.self, forCellWithReuseIdentifier: "movieCell")
        
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MoviesCollectionViewCell
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
extension ViewController : Movies{
    func getMoviesNumber(movies: Int) {
        moviesNumber = movies
    }
    func fetchDataSuccess() {
        collectionView.reloadData()
    }
    func fetchDataFailed(message: String) {
        print(message)
    }
}

