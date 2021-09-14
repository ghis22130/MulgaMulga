//
//  HomeViewController.swift
//  MulgaMulga
//
//  Created by 지북 on 2021/09/07.
//

import UIKit
import Then

class HomeViewController: UIViewController {

    private lazy var areaLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "중곡동"
        $0.font = UIFont.boldSystemFont(ofSize: 24)
    }
    private lazy var marketLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "하나로마트"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    private lazy var homeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .yellow
        $0.dataSource = self
        $0.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
}

// MARK: Layout
extension HomeViewController {
    private func setLayout() {
        setAreaLabel()
        setMarketLabel()
        setTableView()
    }
    
    private func setAreaLabel() {
        view.addSubview(areaLabel)
        areaLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        areaLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
    }
    
    private func setMarketLabel() {
        view.addSubview(marketLabel)
        marketLabel.topAnchor.constraint(equalTo: areaLabel.bottomAnchor, constant: 15).isActive = true
        marketLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
    }
    
    private func setTableView() {
        view.addSubview(homeCollectionView)
        homeCollectionView.topAnchor.constraint(equalTo: marketLabel.bottomAnchor, constant: 15).isActive = true
        homeCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        homeCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
        homeCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
}

//MARK: DataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UICollectionViewCell()
    }
    
    
}

//MARK: Delegate
extension HomeViewController: UICollectionViewDelegate {
    
}
