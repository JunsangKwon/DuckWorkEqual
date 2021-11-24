//
//  MyPageViewController.swift
//  DuckWorkEqual
//
//  Created by 권준상 on 2021/11/24.
//

import UIKit

class MyPageViewController: UIViewController {

    var titleList: [String] = ["스크랩한 기업", "이력서 관리", "검사 결과 조회", "지원한 기업", "체험완료한 기업"]
    var imageNameList: [String] = ["myHeart", "myNote", "myMagnifire", "myCheck", "myExperience"]
    
    let myPageTableView = UITableView().then {
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .none
        $0.backgroundColor = .clear
        $0.rowHeight = UITableView.automaticDimension
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavBar()
        initMyPageTableView()
        setLayouts()
    }
    
    func setNavBar() {
        navigationItem.title = "검사 결과"
        navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func initMyPageTableView() {
        myPageTableView.delegate = self
        myPageTableView.dataSource = self
        myPageTableView.register(MyPageCell.self, forCellReuseIdentifier: "MyPageCell")
    }
    
    private func setLayouts() {
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        view.addSubviews(myPageTableView)
    }
    
    private func setConstraints() {
        let guide = view.safeAreaLayoutGuide
        
        myPageTableView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalTo(guide)
        }
    }
    
    
}

extension MyPageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyPageCell", for: indexPath) as? MyPageCell else { return UITableViewCell() }
        cell.setTitle(title: titleList[indexPath.row], imageName: imageNameList[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    
}
