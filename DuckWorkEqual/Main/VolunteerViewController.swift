//
//  VolunteerViewController.swift
//  DuckWorkEqual
//
//  Created by 권준상 on 2021/11/25.
//

import UIKit
import SnapKit

class VolunteerViewController: UIViewController {

    var mainCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        
        $0.backgroundColor = .colorWithRGBHex(hex: 0xF4F3F3)
        $0.showsVerticalScrollIndicator = false
        $0.collectionViewLayout = layout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .colorWithRGBHex(hex: 0xF4F3F3)
        initMainCollectionView()
        setNavBar()
        setLayouts()
    }
    
    func initMainCollectionView() {
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        mainCollectionView.register(VolunteerCell.self, forCellWithReuseIdentifier: "VolunteerCell")
    }
    
    func setNavBar() {
        navigationController?.isNavigationBarHidden = false
        navigationItem.title = "지원한 기업"
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        backButton.tintColor = .black
        backButton.addTarget(self, action: #selector(backButtonTap), for: .touchUpInside)
        
        let backBarButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = backBarButtonItem
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    private func setLayouts() {
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        view.addSubviews(mainCollectionView)
    }
    
    private func setConstraints() {
        let guide = view.safeAreaLayoutGuide
        
        mainCollectionView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalTo(guide)
        }
    }
    
    @objc func backButtonTap() {
        self.navigationController?.popViewController(animated: true)
    }

}

extension VolunteerViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 20 , height: 165)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VolunteerCell", for: indexPath) as? VolunteerCell
        else {
            return UICollectionViewCell()
        }
        
        return cell
    }
    
    
}
