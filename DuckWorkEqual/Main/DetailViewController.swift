//
//  DetailViewController.swift
//  DuckWorkEqual
//
//  Created by 권준상 on 2021/11/25.
//

import UIKit

class DetailViewController: UIViewController {
    
    let imageList: [UIImage?] = [UIImage(named: "naverLogo"), UIImage(named: "kakaobank"), UIImage(named: "Dang")]
    let enterpriseList: [String] = ["네이버(주)", "(주)카카오뱅크", "(주)당근마켓"]
    let sizeList: [String] = ["대기업", "대기업", "스타트업"]
    let birthDayList: [String] = ["1999년 6월 2일", "2016년 1월 22일", "2015년 6월 15일"]
    let salesList: [String] = ["4조 1266억 2931만원", "8041억 5천만원", "-"]
    let recruitSubtitleList: [String] = ["고용형태", "근무조건", "채용부문", "담당업무", "근무지"]
    let recruitTitleList: [String] = ["청소년 체험형", "주 5일 근무", "프론트엔드 개발자", "사이트 유지 보수 및 개발", "경기 성남시 분당구(판교본사)"]
    let extraSubtitleList: [String] = ["접수기간", "접수방법"]
    let extraTitleList: [String] = ["2021년 11월 9일 ~ 2021년 11월 21일", "본 사이트 접수"]
    static var index: Int = 0
        
    let detailTableView = UITableView(frame: .zero, style: .grouped).then {
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .none
        $0.backgroundColor = .clear
        $0.rowHeight = UITableView.automaticDimension
        $0.tableFooterView = UIView(frame: .zero)
        $0.sectionFooterHeight = 0
    }
    
    let registerButton = UIButton().then {
        $0.setTitle("지원하기", for: .normal)
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
        initDetailTableView()
        setLayouts()
    }
    
    func setNavBar() {
        navigationItem.title = "상세정보"
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        backButton.tintColor = .black
        backButton.addTarget(self, action: #selector(backButtonTap), for: .touchUpInside)
        
        let backBarButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = backBarButtonItem
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func initDetailTableView() {
        detailTableView.delegate = self
        detailTableView.dataSource = self
        detailTableView.register(IntroduceCell.self, forCellReuseIdentifier: "IntroduceCell")
        detailTableView.register(RecruitCell.self, forCellReuseIdentifier: "RecruitCell")
        detailTableView.register(ReviewCell.self, forCellReuseIdentifier: "ReviewCell")
        detailTableView.register(ResultHeaderView.self, forHeaderFooterViewReuseIdentifier: "ResultHeaderView")
    }
    
    private func setLayouts() {
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        view.addSubviews(detailTableView, registerButton)
    }
    
    private func setConstraints() {
        let guide = view.safeAreaLayoutGuide
        
        detailTableView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(guide)
            $0.bottom.equalTo(registerButton.snp.top)
        }
        
        registerButton.snp.makeConstraints {
            $0.leading.trailing.equalTo(guide).inset(20)
            $0.bottom.equalTo(guide)
            $0.height.equalTo(58)
        }
    }
    
    @objc func backButtonTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func goToTabVC() {
        let vc = SubmitResumeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in _: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 5
        case 2:
            return 2
        case 3:
            return 1
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
            return 170
        case 1:
            return 45
        case 2:
            return 45
        case 3:
            return 350
        default:
            return 0
        }
    }
    
    func tableView(_: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let header = detailTableView.dequeueReusableHeaderFooterView(withIdentifier: "ResultHeaderView") as? ResultHeaderView else {
            return nil
        }
        
        switch section {
        case 0:
            header.setTitleText(title: "회사 소개")
            return header
        case 1:
            header.setTitleText(title: "모집부문 및 자격요건")
            return header
        case 2:
            header.setTitleText(title: "접수기간 및 접수방법")
            return header
        case 3:
            header.setTitleText(title: "기업 리뷰")
            return header
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "IntroduceCell", for: indexPath) as? IntroduceCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            cell.logoImageView.image = imageList[DetailViewController.index]
            cell.enterpriseLabel.text = enterpriseList[DetailViewController.index]
            cell.sizeLabel.text = sizeList[DetailViewController.index]
            cell.birthLabel.text = birthDayList[DetailViewController.index]
            cell.salesLabel.text = salesList[DetailViewController.index]
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecruitCell", for: indexPath) as? RecruitCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            cell.setTitle(subtitle: recruitSubtitleList[indexPath.row], title: recruitTitleList[indexPath.row])
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecruitCell", for: indexPath) as? RecruitCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            cell.setTitle(subtitle: extraSubtitleList[indexPath.row], title: extraTitleList[indexPath.row])
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) as? ReviewCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
}
