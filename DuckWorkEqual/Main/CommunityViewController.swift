//
//  CommunityViewController.swift
//  DuckWorkEqual
//
//  Created by 권준상 on 2021/11/24.
//

import UIKit

class CommunityViewController: UIViewController {

    var titleList: [String] = ["이 성적으로 숭실대 갈 수 있을까?", "개발자 취업하려면 뭐부터 공부해야해?", "다들 검사 유형 어떻게 나왔어?"]
    var contentList: [String] = ["오늘 모의고사를 봤는데... 국어는 1등급, 수학은 1등급, 영어는 2등급 이렇게 뜨고 과탐은 다 맞았어! 근데 붙을 수 있을지 걱정되네 정말 ㅠㅠㅠ 이정도면 가능할까? ", "프론트 엔드 개발자가 되는게 꿈이라 이제 조금씩 개발 공부를 해보려고! 어떤 것 부터 공부하는게 좋을까?", "진짜 예상치도 못했는데 내가 사회형이 나왔네 ㅋㅋㅋㅋ 사회형이면 학생들 가르치는 활동을 지원한번 해볼까?"]
    
    let communityTableView =  UITableView(frame: .zero, style: .grouped).then {
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .none
        $0.backgroundColor = .clear
        $0.tableFooterView = UIView(frame: .zero)
        $0.sectionFooterHeight = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavBar()
        initCommunityTableView()
        setLayouts()
    }
    
    func setNavBar() {
        navigationController?.isNavigationBarHidden = false
        navigationItem.title = "커뮤니티"
        navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func initCommunityTableView() {
        communityTableView.delegate = self
        communityTableView.dataSource = self
        communityTableView.register(CommunityCell.self, forCellReuseIdentifier: "CommunityCell")
        communityTableView.register(NoticeHeaderView.self, forHeaderFooterViewReuseIdentifier: "NoticeHeaderView")
    }
    
    private func setLayouts() {
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        view.addSubviews(communityTableView)
    }
    
    private func setConstraints() {
        let guide = view.safeAreaLayoutGuide
        
        communityTableView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalTo(guide)
        }
    }
}

extension CommunityViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let header = communityTableView.dequeueReusableHeaderFooterView(withIdentifier: "NoticeHeaderView") as? NoticeHeaderView else {
            return nil
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommunityCell", for: indexPath) as? CommunityCell else { return UITableViewCell() }
        cell.setTitle(title: titleList[indexPath.row], content: contentList[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    
}
