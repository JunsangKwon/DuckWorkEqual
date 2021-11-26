//
//  ReviewViewController.swift
//  DuckWorkEqual
//
//  Created by 권준상 on 2021/11/26.
//

import UIKit
import Cosmos
import SnapKit

class ReviewViewController: UIViewController {

    let reviewLabel = UILabel().then {
        $0.text = "이 기업은 어떠셨나요?"
        $0.font = .systemFont(ofSize: 26, weight: .bold)
        $0.textColor = .black
    }
    
    var cosmosView = CosmosView().then {
        $0.settings.starSize = 45
        $0.settings.filledColor = .colorWithRGBHex(hex: 0xF6D054)
        $0.settings.emptyColor = .colorWithRGBHex(hex: 0xC4C4C4)
        $0.settings.emptyBorderColor = .colorWithRGBHex(hex: 0xC4C4C4)
        $0.settings.filledBorderColor = .colorWithRGBHex(hex: 0xF6D054)
    }
    
    let reviewSubLabel = UILabel().then {
        $0.text = "여러분의 솔직한 후기를 작성해주세요!"
        $0.font = .systemFont(ofSize: 15, weight: .bold)
        $0.textColor = .black
    }
    
    let reviewTextView = UITextView().then {
        $0.backgroundColor = .colorWithRGBHex(hex: 0xF4F3F3)
        $0.text = "  후기를 입력해주세요."
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = UIColor.lightGray
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    
    let saveButton = UIButton().then {
        $0.setTitle("완료", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        $0.tintColor = .white
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.setBackgroundColor(.colorWithRGBHex(hex: 0x4D86F5), for: .normal)
        $0.addTarget(self, action: #selector(backButtonTap), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavBar()
        reviewTextView.delegate = self
        setLayouts()
    }
    
    func setNavBar() {
        navigationController?.isNavigationBarHidden = false
        navigationItem.title = "후기 작성하기"
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        backButton.tintColor = .black
        backButton.addTarget(self, action: #selector(backButtonTap), for: .touchUpInside)
        
        let backBarButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = backBarButtonItem
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func setLayouts() {
        setViewHierarchy()
        setConstraints()
    }

    func setViewHierarchy() {
        view.addSubviews(reviewLabel, cosmosView, reviewSubLabel, reviewTextView, saveButton)
    }

    func setConstraints() {
        let guide = view.safeAreaLayoutGuide

        reviewLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(80)
        }
        
        cosmosView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(reviewLabel.snp.bottom).offset(20)
            $0.width.equalTo(250)
            $0.height.equalTo(50)
        }
        
        reviewSubLabel.snp.makeConstraints {
            $0.top.equalTo(cosmosView.snp.bottom).offset(80)
            $0.leading.equalToSuperview().offset(20)
        }
        
        reviewTextView.snp.makeConstraints {
            $0.top.equalTo(reviewSubLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(160)
        }
        
        saveButton.snp.makeConstraints {
            $0.bottom.equalTo(guide).offset(-50)
            $0.trailing.equalToSuperview().offset(-30)
            $0.width.equalTo(60)
            $0.height.equalTo(40)
        }
    }

    @objc func backButtonTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension ReviewViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
      if textView.textColor == UIColor.lightGray {
        textView.text = nil
        textView.textColor = UIColor.black
      }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
      if textView.text.isEmpty {
        textView.text = "  후기를 입력해주세요."
        textView.textColor = UIColor.lightGray
      }
    }
}
