//
//  StartTestViewController.swift
//  DuckWorkEqual
//
//  Created by 권준상 on 2021/11/19.
//

import UIKit

class StartTestViewController: UIViewController {

    let mainDescriptionView = UIView().then {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .white
    }
    
    let titleLabel = UILabel().then {
        $0.text = "청소년 직업 흥미 검사란?"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        $0.textColor = .black
    }
    
    let subTitleLabel = UILabel().then {
        $0.text = "청소년들이 진로를 결정하고 직업 세계를 탐색하는 데 도움을 줄 수 있도록 개인의 흥미에 대한 과학적인 분석과 다양한 직업세계에 대한 폭 넓은 정보를 제공하는 검사입니다."
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.lineBreakMode = .byWordWrapping
        $0.numberOfLines = 0
        $0.textColor = .black
        let attrString = NSMutableAttributedString(string: $0.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        $0.attributedText = attrString
    }
    
    let subTitle2Label = UILabel().then {
        $0.text = "본 서비스에서는 이 검사를 바탕으로 이루어집니다. 서비스를 이용하시려면 검사에 참여해주시길 바랍니다."
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.lineBreakMode = .byWordWrapping
        $0.numberOfLines = 0
        $0.textColor = .black
        let attrString = NSMutableAttributedString(string: $0.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        $0.attributedText = attrString
    }
    
    let worknetImageView = UIImageView().then {
        $0.image = UIImage(named: "worknet")
    }
    
    let worknetLabel = UILabel().then {
        $0.text = "이 검사는 워크넷 ‘청소년 직업 흥미 검사’를 \n바탕으로 만들어졌습니다."
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.numberOfLines = 2
        $0.textAlignment = .center
        $0.textColor = .secondaryLabel
        let attrString = NSMutableAttributedString(string: $0.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        paragraphStyle.alignment = .center
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        $0.attributedText = attrString
    }
    
    let startTestButton = UIButton().then {
        $0.setTitle("검사 시작하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 8
        $0.setBackgroundColor(UIColor.colorWithRGBHex(hex: 0x4D86F5), for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tertiarySystemGroupedBackground
        setNavBar()
        setLayouts()
    }
    
    func setNavBar() {
        navigationController?.isNavigationBarHidden = false
        navigationItem.title = "청소년 직업 흥미 검사"
        navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func setLayouts() {
        setViewHierarchy()
        setConstraints()
    }
    
    func setViewHierarchy() {
        view.addSubviews(mainDescriptionView, startTestButton)
        mainDescriptionView.addSubviews(titleLabel, subTitleLabel, subTitle2Label, worknetImageView, worknetLabel)
    }

    func setConstraints() {
        let guide = view.safeAreaLayoutGuide
        
        mainDescriptionView.snp.makeConstraints {
            $0.top.equalTo(guide).offset(30)
            $0.leading.trailing.equalTo(guide).inset(20)
            $0.bottom.equalTo(startTestButton.snp.top).offset(-30)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.leading.equalToSuperview().offset(30)
        }
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        subTitle2Label.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        worknetImageView.snp.makeConstraints {
            $0.width.equalTo(97)
            $0.height.equalTo(28)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(worknetLabel.snp.top).offset(-15)
        }
        worknetLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-30)
        }
        
        startTestButton.snp.makeConstraints { make in
            make.leading.trailing.equalTo(guide).inset(20)
            make.bottom.equalTo(guide).offset(-30)
            make.height.equalTo(58)
        }
    }

}
