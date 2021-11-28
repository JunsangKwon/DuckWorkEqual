//
//  SubmitResumeViewController.swift
//  DuckWorkEqual
//
//  Created by 권준상 on 2021/11/27.
//

import UIKit

class SubmitResumeViewController: UIViewController {

    let scrollView = UIScrollView()
    
    let contentsView = UIView().then {
        $0.backgroundColor = .white
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
    }
    
    let userImageView = UIImageView().then {
        $0.image = UIImage(named: "user")
    }
    
    let userNameLabel = UILabel().then {
        $0.text = "김지훈"
        $0.font = .systemFont(ofSize: 18)
        $0.textColor = .black
    }
    
    let userInfoLabel = UILabel().then {
        $0.text = "남, 18세"
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .black
    }
    
    let userInfoChangeButton = UIButton().then {
        $0.setTitle("회원정보수정", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.colorWithRGBHex(hex: 0xC4C4C4).cgColor
    }
    
    let phoneNumberSubLabel = UILabel().then {
        $0.text = "휴대폰"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .colorWithRGBHex(hex: 0xAFAEAE)
    }
    
    let phoneNumberLabel = UILabel().then {
        $0.text = "010-1234-5678"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .black
    }
    
    let houseNumberSubLabel = UILabel().then {
        $0.text = "유선전화"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .colorWithRGBHex(hex: 0xAFAEAE)
    }
    
    let houseNumberLabel = UILabel().then {
        $0.text = "02-1234-5678"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .black
    }
    
    let emailSubLabel = UILabel().then {
        $0.text = "이메일"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .colorWithRGBHex(hex: 0xAFAEAE)
    }
    
    let emailLabel = UILabel().then {
        $0.text = "lion@naver.com"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .black
    }
    
    let locationSubLabel = UILabel().then {
        $0.text = "주소"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .colorWithRGBHex(hex: 0xAFAEAE)
    }
    
    let locationLabel = UILabel().then {
        $0.text = "서울특별시 강남구"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .black
    }
    
    let lineView = UIView().then {
        $0.backgroundColor = UIColor.colorWithRGBHex(hex: 0xF4F3F3)
    }
    
    let resumeTitleLabel = UILabel().then {
        $0.text = "이력서 제목"
        $0.font = .systemFont(ofSize: 15, weight: .bold)
        $0.textColor = .black
    }
    
    let resumeTitleTextField = UITextField().then {
        $0.backgroundColor = .white
        $0.text = "성실히 임하겠습니다."
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .black
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.colorWithRGBHex(hex: 0xF4F3F3).cgColor
    }
    
    let resumeSubLabel = UILabel().then {
        $0.text = "자기소개서"
        $0.font = .systemFont(ofSize: 15, weight: .bold)
        $0.textColor = .black
    }
    
    let resumeTextView = UITextView().then {
        $0.backgroundColor = .white
        $0.text = "저의 장점은 문제를 해결할 때 다양한 방법으로 접근함으로써 효율적으로 해결책을 찾는 것입니다."
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .black
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.colorWithRGBHex(hex: 0xF4F3F3).cgColor
    }
    
    let submitButton = UIButton().then {
        $0.setTitle("제출하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 8
        $0.setBackgroundColor(UIColor.colorWithRGBHex(hex: 0x4D86F5), for: .normal)
        $0.addTarget(self, action: #selector(submitButtonTap), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tertiarySystemGroupedBackground
        setNavBar()
        setLayouts()
    }
    
    func setNavBar() {
        navigationController?.isNavigationBarHidden = false
        navigationItem.title = "이력서 관리"
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        backButton.tintColor = .black
        backButton.addTarget(self, action: #selector(backButtonTap), for: .touchUpInside)
        
        let backBarButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = backBarButtonItem
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func setLayouts() {
        setViewHierarchy()
        setConstraints()
    }

    func setViewHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentsView)
        contentsView.addSubviews(userImageView, userNameLabel, userInfoLabel, userInfoChangeButton,phoneNumberSubLabel, phoneNumberLabel, houseNumberSubLabel, houseNumberLabel, emailSubLabel, emailLabel, locationSubLabel, locationLabel, lineView, resumeTitleLabel, resumeTitleTextField, resumeSubLabel, resumeTextView, submitButton)
    }

    func setConstraints() {

        scrollView.snp.makeConstraints {
            $0.edges.equalTo(0)
        }
        
        contentsView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(350)
            $0.height.equalTo(700)
        }
        
        userImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.leading.equalToSuperview().offset(30)
            $0.width.height.equalTo(58)
        }
        
        userNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.leading.equalTo(userImageView.snp.trailing).offset(30)
        }
        
        userInfoLabel.snp.makeConstraints {
            $0.bottom.equalTo(userNameLabel.snp.bottom)
            $0.leading.equalTo(userNameLabel.snp.trailing).offset(5)
        }
        
        userInfoChangeButton.snp.makeConstraints {
            $0.top.equalTo(userInfoLabel.snp.bottom).offset(10)
            $0.leading.equalTo(userImageView.snp.trailing).offset(30)
            $0.width.equalTo(90)
            $0.height.equalTo(25)
        }
        
        phoneNumberSubLabel.snp.makeConstraints {
            $0.top.equalTo(userImageView.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(30)
            $0.width.equalTo(70)
        }
        
        phoneNumberLabel.snp.makeConstraints {
            $0.centerY.equalTo(phoneNumberSubLabel)
            $0.leading.equalTo(phoneNumberSubLabel.snp.trailing).offset(20)
        }
        
        houseNumberSubLabel.snp.makeConstraints {
            $0.top.equalTo(phoneNumberSubLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(30)
            $0.width.equalTo(70)
        }
        
        houseNumberLabel.snp.makeConstraints {
            $0.centerY.equalTo(houseNumberSubLabel)
            $0.leading.equalTo(houseNumberSubLabel.snp.trailing).offset(20)
        }
        
        emailSubLabel.snp.makeConstraints {
            $0.top.equalTo(houseNumberSubLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(30)
            $0.width.equalTo(70)
        }
        
        emailLabel.snp.makeConstraints {
            $0.centerY.equalTo(emailSubLabel)
            $0.leading.equalTo(emailSubLabel.snp.trailing).offset(20)
        }
        
        locationSubLabel.snp.makeConstraints {
            $0.top.equalTo(emailSubLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(30)
            $0.width.equalTo(70)
        }
        
        locationLabel.snp.makeConstraints {
            $0.centerY.equalTo(locationSubLabel)
            $0.leading.equalTo(locationSubLabel.snp.trailing).offset(20)
        }
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(1)
        }
        
        resumeTitleLabel.snp.makeConstraints {
            $0.top.equalTo(lineView.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(20)
        }
        
        resumeTitleTextField.snp.makeConstraints {
            $0.top.equalTo(resumeTitleLabel.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(25)
        }
        
        resumeSubLabel.snp.makeConstraints {
            $0.top.equalTo(resumeTitleTextField.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
        }
        
        resumeTextView.snp.makeConstraints {
            $0.top.equalTo(resumeSubLabel.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(175)
        }
        
        submitButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().offset(-30)
            $0.height.equalTo(58)
        }
        

    }

    @objc func backButtonTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func submitButtonTap() {
        showAlert(message: "제출이 완료되었습니다.")
        self.navigationController?.popViewController(animated: true)
    }
}
