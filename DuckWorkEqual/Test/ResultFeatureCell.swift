//
//  ResultFeatureCell.swift
//  DuckWorkEqual
//
//  Created by 권준상 on 2021/11/22.
//

import UIKit
import SnapKit

class ResultFeatureCell: UITableViewCell {
    
    let numberButton = UIButton().then {
        $0.tintColor = .black
    }
    
    let typeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 17)
        $0.textColor = .black
    }
    
    let lineView = UIView().then {
        $0.backgroundColor = UIColor.colorWithRGBHex(hex: 0xF4F3F3)
    }
    
    let featureTitleLabel = UILabel().then {
        $0.text = "특징"
        $0.font = .systemFont(ofSize: 15, weight: .bold)
        $0.textColor = .black
    }
    
    let dotLabel = UILabel().then {
        $0.text = "●"
        $0.font = .systemFont(ofSize: 5, weight: .bold)
        $0.textColor = .black
    }
    
    let featureLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15)
        $0.textColor = .black
    }
    
    let dotLabel2 = UILabel().then {
        $0.text = "●"
        $0.font = .systemFont(ofSize: 5, weight: .bold)
        $0.textColor = .black
    }
    
    let featureLabel2 = UILabel().then {
        $0.font = .systemFont(ofSize: 15)
        $0.textColor = .black
    }
    
    let preferJobActionTitleLabel = UILabel().then {
        $0.text = "선호 직업활동"
        $0.font = .systemFont(ofSize: 15, weight: .bold)
        $0.textColor = .black
    }
    
    let dotLabel3 = UILabel().then {
        $0.text = "●"
        $0.font = .systemFont(ofSize: 5, weight: .bold)
        $0.textColor = .black
    }
    
    let preferJobActionLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15)
        $0.textColor = .black
        $0.lineBreakMode = .byWordWrapping
        $0.numberOfLines = 0
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        contentView.addSubviews(numberButton, typeLabel, lineView, featureTitleLabel, dotLabel, featureLabel, dotLabel2, featureLabel2, preferJobActionTitleLabel, dotLabel3, preferJobActionLabel)
    }

    private func setConstraints() {
        contentView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(250)
        }
        
        numberButton.snp.makeConstraints {
            $0.width.height.equalTo(13)
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(40)
        }
        
        typeLabel.snp.makeConstraints {
            $0.centerY.equalTo(numberButton)
            $0.leading.equalTo(numberButton.snp.trailing).offset(15)
        }
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(numberButton.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(1)
        }
        
        featureTitleLabel.snp.makeConstraints {
            $0.top.equalTo(lineView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(70)
        }
        
        dotLabel.snp.makeConstraints {
            $0.centerY.equalTo(featureLabel)
            $0.leading.equalToSuperview().offset(75)
        }
        
        featureLabel.snp.makeConstraints {
            $0.top.equalTo(featureTitleLabel.snp.bottom).offset(10)
            $0.leading.equalTo(dotLabel).offset(10)
        }
        
        dotLabel2.snp.makeConstraints {
            $0.centerY.equalTo(featureLabel2)
            $0.leading.equalToSuperview().offset(75)
        }
        
        featureLabel2.snp.makeConstraints {
            $0.top.equalTo(featureLabel.snp.bottom).offset(10)
            $0.leading.equalTo(dotLabel2).offset(10)
        }

        preferJobActionTitleLabel.snp.makeConstraints {
            $0.top.equalTo(featureLabel2.snp.bottom).offset(25)
            $0.leading.equalToSuperview().offset(70)
        }
        
        dotLabel3.snp.makeConstraints {
            $0.top.equalTo(preferJobActionTitleLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(75)
        }
        
        preferJobActionLabel.snp.makeConstraints {
            $0.top.equalTo(preferJobActionTitleLabel.snp.bottom).offset(10)
            $0.leading.equalTo(dotLabel3).offset(10)
            $0.trailing.equalToSuperview().offset(-70)
        }

    }

    public func setTitle(number: Int, type: String, feature: [String], prefer: String) {
        numberButton.setImage(UIImage(systemName: "\(number + 1).circle"), for: .normal)
        typeLabel.text = type
        featureLabel.text = feature[0]
        featureLabel2.text = feature[1]
        preferJobActionLabel.text = prefer
    }

}
