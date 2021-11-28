//
//  TestQuestionViewController.swift
//  DuckWorkEqual
//
//  Created by 권준상 on 2021/11/20.
//

import UIKit
import SnapKit

class TestQuestionViewController: UIViewController {
    
    let questionView = UIView().then {
        $0.backgroundColor = .white
    }
    
    let progressBarView = UIView().then {
        $0.backgroundColor = .white
    }
    
    let progressBar = UIProgressView().then {
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        $0.layer.sublayers![1].cornerRadius = 8
        $0.subviews[1].clipsToBounds = true
        $0.progress = 0.0
        $0.tintColor = .colorWithRGBHex(hex: 0x4D86F5)
    }
    
    let progressLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        $0.textColor = .black
    }
    
    let questionTitleLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        $0.lineBreakMode = .byWordWrapping
        $0.numberOfLines = 0
        $0.textColor = .black
    }
    
    let questionNumberButton = UIButton().then {
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = $0.frame.width/2
        $0.setBackgroundColor(UIColor.colorWithRGBHex(hex: 0x4D86F5), for: .disabled)
        $0.isEnabled = false
    }
    
    let lineView = UIView().then {
        $0.backgroundColor = UIColor.colorWithRGBHex(hex: 0xF4F3F3)
    }
    
    let veryGoodButton = QuestionButton().then {
        $0.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
        $0.tag = 1
    }
    
    let veryGoodLabel = UILabel().then {
        $0.text = "매우 그렇다"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        $0.textColor = .black
    }
    
    let goodButton = QuestionButton().then {
        $0.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
        $0.tag = 2
    }
    
    let goodLabel = UILabel().then {
        $0.text = "그렇다"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        $0.textColor = .black
    }
    
    let sosoButton = QuestionButton().then {
        $0.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
        $0.tag = 3
    }
    
    let sosoLabel = UILabel().then {
        $0.text = "보통이다"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        $0.textColor = .black
    }
    
    let badButton = QuestionButton().then {
        $0.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
        $0.tag = 4
    }
    
    let badLabel = UILabel().then {
        $0.text = "아니다"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        $0.textColor = .black
    }
    
    let veryBadButton = QuestionButton().then {
        $0.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
        $0.tag = 5
    }
    
    let veryBadLabel = UILabel().then {
        $0.text = "매우 아니다"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        $0.textColor = .black
    }
    
    let previousQuestionButton = UIButton().then {
        $0.setImage(UIImage(named: "arrow_left_icon"), for: .normal)
        $0.tintColor = .white
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 25
        $0.contentMode = .scaleToFill
        $0.setBackgroundColor(.colorWithRGBHex(hex: 0x4D86F5), for: .normal)
    }
    
    let nextQuestionButton = UIButton().then {
        $0.setImage(UIImage(named: "arrow_right_icon"), for: .normal)
        $0.tintColor = .white
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 25
        $0.contentMode = .scaleToFill
        $0.setBackgroundColor(.colorWithRGBHex(hex: 0x4D86F5), for: .normal)
    }
    
    let completeButton = UIButton().then {
        $0.setTitle("완료", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        $0.tintColor = .white
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.setBackgroundColor(.colorWithRGBHex(hex: 0x4D86F5), for: .normal)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tertiarySystemGroupedBackground
        setNavBar()
        setButtonTarget()
        setLayouts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateLabel()
        setButtonSelected()
        resetLayouts()
    }
    
    func updateLabel() {
        progressLabel.text = "\(TestData.level) / 24"
        questionTitleLabel.text = "\(TestData.questionList[TestData.level - 1])"
        questionNumberButton.setTitle("\(TestData.level)", for: .normal)
        progressBar.setProgress(Float(TestData.level) / Float(24), animated: false)
    }
    
    func setButtonSelected() {
        [veryGoodButton, goodButton, sosoButton, badButton, veryBadButton].forEach {
            if $0.tag == TestData.checkList[TestData.level - 1] {
                $0.isSelected = true
            } else {
                $0.isSelected = false
            }
        }
    }
    
    func resetLayouts() {
        if TestData.level == 24 {
            nextQuestionButton.removeFromSuperview()
            questionView.addSubview(completeButton)
            
            completeButton.snp.makeConstraints {
                $0.bottom.equalToSuperview().offset(-50)
                $0.trailing.equalToSuperview().offset(-30)
                $0.width.equalTo(60)
                $0.height.equalTo(40)
            }
        } else {
            completeButton.removeFromSuperview()
        }
    }
    
    func setNavBar() {
        navigationItem.title = "청소년 직업 흥미 검사"
        navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func setButtonTarget() {
        [veryGoodButton, goodButton, sosoButton, badButton, veryBadButton, previousQuestionButton, nextQuestionButton, completeButton].forEach {
            $0.addTarget(self, action: #selector(buttonTapAction(_:)), for: .touchUpInside)
        }
    }
    
    func setLayouts() {
        setViewHierarchy()
        setConstraints()
    }
        
    func setViewHierarchy() {
        view.addSubviews(questionView, progressBarView)
        progressBarView.addSubviews(progressBar, progressLabel)
        questionView.addSubviews(questionTitleLabel, questionNumberButton, lineView, veryGoodButton, goodButton, sosoButton, badButton, veryBadButton, previousQuestionButton, nextQuestionButton,     veryGoodLabel,goodLabel,sosoLabel,badLabel,veryBadLabel)
    }

    func setConstraints() {
        let guide = view.safeAreaLayoutGuide
        
        progressBarView.snp.makeConstraints {
            $0.top.equalTo(guide)
            $0.leading.trailing.equalTo(guide)
            $0.height.equalTo(50)
        }
        
        progressBar.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalTo(progressLabel.snp.leading).offset(-30)
            $0.height.equalTo(10)
        }
        
        progressLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-30)
        }
        
        questionView.snp.makeConstraints {
            $0.top.equalTo(progressBarView.snp.bottom).offset(30)
            $0.leading.trailing.equalTo(guide).inset(20)
            $0.bottom.equalTo(guide).offset(-15)
        }
        
        questionNumberButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.equalToSuperview().offset(20)
            $0.width.height.equalTo(30)
        }
        
        questionTitleLabel.snp.makeConstraints {
            $0.centerY.equalTo(questionNumberButton)
            $0.leading.equalTo(questionNumberButton.snp.trailing).offset(15)
            $0.trailing.equalToSuperview().offset(-30)
        }
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(questionTitleLabel.snp.bottom).offset(50)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(1)
        }
        
        veryGoodButton.snp.makeConstraints {
            $0.top.equalTo(lineView.snp.bottom).offset(50)
            $0.leading.equalToSuperview().offset(30)
            $0.width.height.equalTo(45)
        }
        
        veryGoodLabel.snp.makeConstraints {
            $0.centerY.equalTo(veryGoodButton)
            $0.leading.equalTo(veryGoodButton.snp.trailing).offset(15)
        }
        
        goodButton.snp.makeConstraints {
            $0.top.equalTo(veryGoodButton.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(30)
            $0.width.height.equalTo(45)
        }
        
        goodLabel.snp.makeConstraints {
            $0.centerY.equalTo(goodButton)
            $0.leading.equalTo(goodButton.snp.trailing).offset(15)
        }
        
        sosoButton.snp.makeConstraints {
            $0.top.equalTo(goodButton.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(30)
            $0.width.height.equalTo(45)
        }
        
        sosoLabel.snp.makeConstraints {
            $0.centerY.equalTo(sosoButton)
            $0.leading.equalTo(sosoButton.snp.trailing).offset(15)
        }
        
        badButton.snp.makeConstraints {
            $0.top.equalTo(sosoButton.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(30)
            $0.width.height.equalTo(45)
        }
        
        badLabel.snp.makeConstraints {
            $0.centerY.equalTo(badButton)
            $0.leading.equalTo(badButton.snp.trailing).offset(15)
        }
        
        veryBadButton.snp.makeConstraints {
            $0.top.equalTo(badButton.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(30)
            $0.width.height.equalTo(45)
        }
        
        veryBadLabel.snp.makeConstraints {
            $0.centerY.equalTo(veryBadButton)
            $0.leading.equalTo(veryBadButton.snp.trailing).offset(15)
        }
        
        previousQuestionButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-50)
            $0.leading.equalToSuperview().offset(30)
            $0.width.height.equalTo(50)
        }
        
        nextQuestionButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-50)
            $0.trailing.equalToSuperview().offset(-30)
            $0.width.height.equalTo(50)
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }

    @objc
    private func buttonTapAction(_ sender: UIButton) {
        switch sender {
        case veryGoodButton:
            if !sender.isSelected {
                TestData.checkList[TestData.level - 1] = sender.tag
                veryGoodButton.isSelected = true
                goodButton.isSelected = false
                sosoButton.isSelected = false
                badButton.isSelected = false
                veryBadButton.isSelected = false
            } else {
                veryGoodButton.isSelected = false
            }
        case goodButton:
            if !sender.isSelected {
                TestData.checkList[TestData.level - 1] = sender.tag
                goodButton.isSelected = true
                veryGoodButton.isSelected = false
                sosoButton.isSelected = false
                badButton.isSelected = false
                veryBadButton.isSelected = false
            } else {
                goodButton.isSelected = false
            }
        case sosoButton:
            if !sender.isSelected {
                TestData.checkList[TestData.level - 1] = sender.tag
                sosoButton.isSelected = true
                veryGoodButton.isSelected = false
                goodButton.isSelected = false
                badButton.isSelected = false
                veryBadButton.isSelected = false
            } else {
                sosoButton.isSelected = false
            }
        case badButton:
            if !sender.isSelected {
                TestData.checkList[TestData.level - 1] = sender.tag
                badButton.isSelected = true
                veryGoodButton.isSelected = false
                goodButton.isSelected = false
                sosoButton.isSelected = false
                veryBadButton.isSelected = false
            } else {
                badButton.isSelected = false
            }
        case veryBadButton:
            if !sender.isSelected {
                TestData.checkList[TestData.level - 1] = sender.tag
                veryBadButton.isSelected = true
                veryGoodButton.isSelected = false
                goodButton.isSelected = false
                sosoButton.isSelected = false
                badButton.isSelected = false
            } else {
                veryBadButton.isSelected = false
            }
        case previousQuestionButton:
            if TestData.level < 2 {
                showAlert(message: "이전 문항이 존재하지 않습니다")
            } else {
                TestData.level -= 1
                self.navigationController?.popViewController(animated: true)
            }
        case nextQuestionButton:
            if !veryGoodButton.isSelected, !goodButton.isSelected, !sosoButton.isSelected, !badButton.isSelected, !veryBadButton.isSelected {
                showAlert(message: "하나를 선택해주세요")
            } else {
                let vc = TestQuestionViewController()
                TestData.level += 1
                self.navigationController?.pushViewController(vc, animated: true)
            }
        case completeButton:
            let vc = TestResultViewController()
            TestData.level = 1
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            return
        }
        
    }

}
