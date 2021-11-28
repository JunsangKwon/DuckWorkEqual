//
//  RecommendEnterpriseViewController.swift
//  DuckWorkEqual
//
//  Created by 권준상 on 2021/11/24.
//

import UIKit

class RecommendEnterpriseViewController: UIViewController {
    
    let imageList: [UIImage?] = [UIImage(named: "naverLogo"), UIImage(named: "kakaobank"), UIImage(named: "Dang")]
    let enterpriseList: [String] = ["(주) NAVER", "(주)카카오뱅크", "(주)당근마켓"]
    let titleList: [String] = ["[NAVER Cloud] 네이버 프론트엔드 직업체험", "[뉴플랫폼기술] 클라우드 엔지니어", "백엔드 개발 인턴"]
    
    var searchBar = UISearchBar().then {
        $0.text = "#탐구형"
        $0.backgroundColor = .white
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.searchTextField.clipsToBounds = true
        $0.searchTextField.layer.cornerRadius = 10
        $0.searchTextField.backgroundColor = .white
        $0.searchTextField.font = UIFont.systemFont(ofSize: 12)
    }

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
        mainCollectionView.register(EnterpriseCell.self, forCellWithReuseIdentifier: "EnterpriseCell")
    }
    
    func setNavBar() {
        navigationController?.isNavigationBarHidden = false
        navigationItem.title = "기업찾기"
        navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    private func setLayouts() {
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        view.addSubviews(searchBar, mainCollectionView)
    }
    
    private func setConstraints() {
        let guide = view.safeAreaLayoutGuide
        
        searchBar.snp.makeConstraints {
            $0.top.equalTo(guide).offset(15)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(337)
            $0.height.equalTo(30)
        }
        
        mainCollectionView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(15)
            $0.leading.trailing.bottom.equalTo(guide)
        }
    }
    
    @objc func scrapButtonDidTap(sender: UIButton) {
        if !sender.isSelected {
            sender.isSelected = true
        } else {
            sender.isSelected = false
        }
    }

}

extension RecommendEnterpriseViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 20 , height: 165)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EnterpriseCell", for: indexPath) as? EnterpriseCell
        else {
            return UICollectionViewCell()
        }
        cell.logoImageView.image = imageList[indexPath.row]
        cell.enterpriceNameLabel.text = enterpriseList[indexPath.item]
        cell.titleLabel.text = titleList[indexPath.item]
        cell.scrapButton.addTarget(self, action: #selector(scrapButtonDidTap), for: .touchUpInside)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        DetailViewController.index = indexPath.item
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
