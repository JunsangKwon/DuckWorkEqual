//
//  VolunteerCell.swift
//  DuckWorkEqual
//
//  Created by 권준상 on 2021/11/25.
//

import UIKit
import SnapKit

class VolunteerCell: UICollectionViewCell {
    let shadowView = UIView().then {
        $0.layer.masksToBounds = false
        $0.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        $0.layer.shadowOpacity = 0.2
        $0.layer.shadowColor = UIColor.black.cgColor
    }
    
    let containerView = UIView().then {
        $0.backgroundColor = .white
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    
    let enterpriceNameLabel = UILabel().then {
        $0.text = "(주) NAVER"
        $0.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
        $0.textColor = .secondaryLabel
    }
    
    let titleLabel = UILabel().then {
        $0.text = "[NAVER Cloud] 네이버 프론트엔드 직업체험"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        $0.textColor = .black
    }
    
    let hashTagLabel = UILabel().then {
        $0.text = "#탐구형 #현실형"
        $0.font = UIFont.systemFont(ofSize: 11, weight: .bold)
        $0.textColor = .secondaryLabel
    }
    
    let logoImageView = UIImageView().then {
        $0.image = UIImage(named: "naverLogo")
    }
    
    let lineView = UIView().then {
        $0.backgroundColor = UIColor.colorWithRGBHex(hex: 0xF4F3F3)
    }
    
    let starLabel = UILabel().then {
        $0.text = "별점 :"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        $0.textColor = .black
    }
    
    let starButton1 = UIButton().then {
        $0.setImage(UIImage(systemName: "star.fill"), for: .normal)
        $0.tintColor = .colorWithRGBHex(hex: 0xF6D054)
    }
    
    let starButton2 = UIButton().then {
        $0.setImage(UIImage(systemName: "star.fill"), for: .normal)
        $0.tintColor = .colorWithRGBHex(hex: 0xF6D054)
    }
    
    let starButton3 = UIButton().then {
        $0.setImage(UIImage(systemName: "star.fill"), for: .normal)
        $0.tintColor = .colorWithRGBHex(hex: 0xF6D054)
    }
    
    let starButton4 = UIButton().then {
        $0.setImage(UIImage(systemName: "star.fill"), for: .normal)
        $0.tintColor = .colorWithRGBHex(hex: 0xF6D054)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayouts() {
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        contentView.addSubview(shadowView)
        shadowView.addSubview(containerView)
        containerView.addSubviews(enterpriceNameLabel, titleLabel, hashTagLabel, logoImageView, lineView, starLabel, starButton1, starButton2, starButton3, starButton4)
    }
    
    private func setConstraints() {
        
        shadowView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(10)
            $0.leading.trailing.equalToSuperview()
        }
        
        containerView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        enterpriceNameLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(20)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(enterpriceNameLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalTo(logoImageView.snp.leading).offset(-20)
        }
        
        hashTagLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(22)
        }
        
        logoImageView.snp.makeConstraints {
            $0.width.height.equalTo(40)
            $0.top.equalTo(enterpriceNameLabel.snp.bottom).offset(10)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(hashTagLabel.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(1)
        }
        
        starLabel.snp.makeConstraints {
            $0.top.equalTo(lineView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
        }
        
        starButton1.snp.makeConstraints {
            $0.centerY.equalTo(starLabel)
            $0.leading.equalTo(starLabel.snp.trailing).offset(3)
            $0.width.height.equalTo(14)
        }
        
        starButton2.snp.makeConstraints {
            $0.centerY.equalTo(starLabel)
            $0.leading.equalTo(starButton1.snp.trailing)
            $0.width.height.equalTo(14)
        }
        
        starButton3.snp.makeConstraints {
            $0.centerY.equalTo(starLabel)
            $0.leading.equalTo(starButton2.snp.trailing)
            $0.width.height.equalTo(14)
        }
        
        starButton4.snp.makeConstraints {
            $0.centerY.equalTo(starLabel)
            $0.leading.equalTo(starButton3.snp.trailing)
            $0.width.height.equalTo(14)
        }
    }
    
    
}
