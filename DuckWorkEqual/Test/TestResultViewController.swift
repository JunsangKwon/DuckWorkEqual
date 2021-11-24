//
//  TestResultViewController.swift
//  DuckWorkEqual
//
//  Created by 권준상 on 2021/11/21.
//

import UIKit
import SnapKit

class TestResultViewController: UIViewController {
    
    let sceneDelegate = UIApplication.shared.connectedScenes
            .first!.delegate as! SceneDelegate
        
    let resultTableView = UITableView(frame: .zero, style: .grouped).then {
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .none
        $0.backgroundColor = .clear
        $0.rowHeight = UITableView.automaticDimension
        $0.tableFooterView = UIView(frame: .zero)
        $0.sectionFooterHeight = 0
    }
    
    let startMainButton = UIButton().then {
        $0.setTitle("추천 기업 만나러 가기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 8
        $0.setBackgroundColor(UIColor.colorWithRGBHex(hex: 0x4D86F5), for: .normal)
        $0.addTarget(self, action: #selector(goToTabVC), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavBar()
        initResultTableView()
        setLayouts()
    }
    
    func setNavBar() {
        navigationItem.title = "검사 결과"
        navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func initResultTableView() {
        resultTableView.delegate = self
        resultTableView.dataSource = self
        resultTableView.register(ResultFeatureCell.self, forCellReuseIdentifier: "ResultFeatureCell")
        resultTableView.register(ResultTypeCell.self, forCellReuseIdentifier: "ResultTypeCell")
        resultTableView.register(ResultHeaderView.self, forHeaderFooterViewReuseIdentifier: "ResultHeaderView")
    }
    
    private func setLayouts() {
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        view.addSubviews(resultTableView, startMainButton)
    }
    
    private func setConstraints() {
        let guide = view.safeAreaLayoutGuide
        
        resultTableView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(guide)
            $0.bottom.equalTo(startMainButton.snp.top)
        }
        
        startMainButton.snp.makeConstraints {
            $0.leading.trailing.equalTo(guide).inset(20)
            $0.bottom.equalTo(guide)
            $0.height.equalTo(58)
        }
    }
    
    @objc func goToTabVC() {
        UserDefaults.standard.setValue(true, forKey: SignInViewController.testKey)
        sceneDelegate.window?.rootViewController = MainTabBarController()
    }
    
}

extension TestResultViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in _: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 2
        default:
            return 0
        }
    }
    
    
    func tableView(_: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 260
        case 1:
            return 70
        default:
            return 0
        }
    }
    
    func tableView(_: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let header = resultTableView.dequeueReusableHeaderFooterView(withIdentifier: "ResultHeaderView") as? ResultHeaderView else {
            return nil
        }
        
        switch section {
        case 0:
            header.setTitleText(title: "당신의 흥미유형 결과")
            return header
        case 1:
            header.setTitleText(title: "직업 추천")
            return header
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ResultFeatureCell", for: indexPath) as? ResultFeatureCell else { return UITableViewCell() }
            cell.setTitle(number: indexPath.row, type: TestData.resultInfoList[indexPath.row].type, feature: TestData.resultInfoList[indexPath.row].feature, prefer: TestData.resultInfoList[indexPath.row].preferJobAction)
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ResultTypeCell", for: indexPath) as? ResultTypeCell else { return UITableViewCell() }
            cell.setTitle(type: TestData.resultInfoList[indexPath.row].type, example: TestData.resultInfoList[indexPath.row].example)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
}
