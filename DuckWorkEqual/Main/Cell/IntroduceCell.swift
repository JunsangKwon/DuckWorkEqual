//
//  IntroduceCell.swift
//  DuckWorkEqual
//
//  Created by 권준상 on 2021/11/25.
//

import UIKit
import SnapKit

class IntroduceCell: UITableViewCell {
        
    let logoImageView = UIImageView().then {
        $0.image = UIImage(named: "naverLogo")
    }
    
    let enterpriseSubLabel = UILabel().then {
        $0.text = "기업명"
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .colorWithRGBHex(hex: 0xAFAEAE)
    }
    
    let enterpriseLabel = UILabel().then {
        $0.text = "네이버(주)"
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .black
    }
    
    let lineView = UIView().then {
        $0.backgroundColor = UIColor.colorWithRGBHex(hex: 0xF4F3F3)
    }
    
    let sizeSubLabel = UILabel().then {
        $0.text = "기업규모"
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .colorWithRGBHex(hex: 0xAFAEAE)
    }
    
    let sizeLabel = UILabel().then {
        $0.text = "대기업"
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .black
    }
    
    let lineView2 = UIView().then {
        $0.backgroundColor = UIColor.colorWithRGBHex(hex: 0xF4F3F3)
    }
    
    let birthSubLabel = UILabel().then {
        $0.text = "설립일"
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .colorWithRGBHex(hex: 0xAFAEAE)
    }
    
    let birthLabel = UILabel().then {
        $0.text = "1999년 6월 2일"
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .black
    }
    
    let lineView3 = UIView().then {
        $0.backgroundColor = UIColor.colorWithRGBHex(hex: 0xF4F3F3)
    }
    
    let salesSubLabel = UILabel().then {
        $0.text = "매출액"
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .colorWithRGBHex(hex: 0xAFAEAE)
    }
    
    let salesLabel = UILabel().then {
        $0.text = "4조 1,266억 2,931만원"
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .black
    }
    
    let lineView4 = UIView().then {
        $0.backgroundColor = UIColor.colorWithRGBHex(hex: 0xF4F3F3)
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
        contentView.addSubviews(logoImageView,enterpriseSubLabel,enterpriseLabel,lineView,sizeSubLabel,sizeLabel,lineView2,birthSubLabel,birthLabel,lineView3,salesSubLabel,salesLabel,lineView4)
    }

    private func setConstraints() {
        contentView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(170)
        }
        
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().offset(30)
            $0.width.height.equalTo(50)
        }
        
        enterpriseSubLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalTo(logoImageView.snp.trailing).offset(20)
        }
        
        enterpriseLabel.snp.makeConstraints {
            $0.centerY.equalTo(enterpriseSubLabel)
            $0.leading.equalTo(enterpriseSubLabel.snp.trailing).offset(30)
        }
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(enterpriseSubLabel.snp.bottom).offset(8)
            $0.leading.equalTo(logoImageView.snp.trailing).offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(1)
        }
        
        sizeSubLabel.snp.makeConstraints {
            $0.top.equalTo(lineView.snp.bottom).offset(8)
            $0.leading.equalTo(logoImageView.snp.trailing).offset(20)
        }
        
        sizeLabel.snp.makeConstraints {
            $0.centerY.equalTo(sizeSubLabel)
            $0.leading.equalTo(enterpriseLabel.snp.leading)
        }
        
        lineView2.snp.makeConstraints {
            $0.top.equalTo(sizeSubLabel.snp.bottom).offset(8)
            $0.leading.equalTo(logoImageView.snp.trailing).offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(1)
        }
        
        birthSubLabel.snp.makeConstraints {
            $0.top.equalTo(lineView2.snp.bottom).offset(8)
            $0.leading.equalTo(logoImageView.snp.trailing).offset(20)
        }
        
        birthLabel.snp.makeConstraints {
            $0.centerY.equalTo(birthSubLabel)
            $0.leading.equalTo(enterpriseLabel.snp.leading)
        }
        
        lineView3.snp.makeConstraints {
            $0.top.equalTo(birthSubLabel.snp.bottom).offset(8)
            $0.leading.equalTo(logoImageView.snp.trailing).offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(1)
        }
        
        salesSubLabel.snp.makeConstraints {
            $0.top.equalTo(lineView3.snp.bottom).offset(8)
            $0.leading.equalTo(logoImageView.snp.trailing).offset(20)
        }
        
        salesLabel.snp.makeConstraints {
            $0.centerY.equalTo(salesSubLabel)
            $0.leading.equalTo(enterpriseLabel.snp.leading)
        }
        
        lineView4.snp.makeConstraints {
            $0.top.equalTo(salesSubLabel.snp.bottom).offset(8)
            $0.leading.equalTo(logoImageView.snp.trailing).offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(1)
        }

    }

}
