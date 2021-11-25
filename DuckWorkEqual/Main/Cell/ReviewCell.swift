//
//  ReviewCell.swift
//  DuckWorkEqual
//
//  Created by 권준상 on 2021/11/25.
//

import UIKit
import SnapKit

class ReviewCell: UITableViewCell {
    
    let satisfactionLabel = UILabel().then {
        $0.text = "기업만족도"
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .colorWithRGBHex(hex: 0xAFAEAE)
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
    
    let starButton5 = UIButton().then {
        $0.setImage(UIImage(systemName: "star.fill"), for: .normal)
        $0.tintColor = .colorWithRGBHex(hex: 0xC4C4C4)
    }

    let lineView = UIView().then {
        $0.backgroundColor = UIColor.colorWithRGBHex(hex: 0xF4F3F3)
    }
    
    let reviewSubLabel = UILabel().then {
        $0.text = "기업리뷰"
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .colorWithRGBHex(hex: 0xAFAEAE)
    }
    
    let idLabel = UILabel().then {
        $0.text = "student1"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .black
    }
    
    let reviewView = UIView().then {
        $0.backgroundColor = UIColor.colorWithRGBHex(hex: 0xF4F3F3)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    
    let reviewLabel = UILabel().then {
        $0.text = "많은 것을 배워갈 수 있다. 직원분들의 말씀을 듣고 다시한번 생각해보는 계기가 되었다."
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
    }
    
    let idLabel2 = UILabel().then {
        $0.text = "student2"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .black
    }
    
    let reviewView2 = UIView().then {
        $0.backgroundColor = UIColor.colorWithRGBHex(hex: 0xF4F3F3)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    
    let reviewLabel2 = UILabel().then {
        $0.text = "정말 좋은 경험이었습니다. 사람들도 많고 가기위해서 공부를 더 열심히 해야겠네요."
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
    }
    
    let idLabel3 = UILabel().then {
        $0.text = "student3"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .black
    }
    
    let reviewView3 = UIView().then {
        $0.backgroundColor = UIColor.colorWithRGBHex(hex: 0xF4F3F3)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    
    let reviewLabel3 = UILabel().then {
        $0.text = "복지가 좋았고 직접 업무를 경험할 수 있어서 너무 유익했습니다."
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
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
        contentView.addSubviews(satisfactionLabel, starButton1, starButton2, starButton3, starButton4, starButton5, lineView, reviewSubLabel, idLabel, reviewView, idLabel2, reviewView2, idLabel3, reviewView3)
        reviewView.addSubview(reviewLabel)
        reviewView2.addSubview(reviewLabel2)
        reviewView3.addSubview(reviewLabel3)
    }

    private func setConstraints() {
        contentView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(350)
        }
        
        satisfactionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().offset(20)
        }
        
        starButton1.snp.makeConstraints {
            $0.width.height.equalTo(15)
            $0.centerY.equalTo(satisfactionLabel)
            $0.leading.equalTo(satisfactionLabel.snp.trailing).offset(30)
        }
        
        starButton2.snp.makeConstraints {
            $0.width.height.equalTo(15)
            $0.centerY.equalTo(starButton1)
            $0.leading.equalTo(starButton1.snp.trailing).offset(5)
        }
        
        starButton3.snp.makeConstraints {
            $0.width.height.equalTo(15)
            $0.centerY.equalTo(starButton1)
            $0.leading.equalTo(starButton2.snp.trailing).offset(5)
        }
        
        starButton4.snp.makeConstraints {
            $0.width.height.equalTo(15)
            $0.centerY.equalTo(starButton1)
            $0.leading.equalTo(starButton3.snp.trailing).offset(5)
        }
        
        starButton5.snp.makeConstraints {
            $0.width.height.equalTo(15)
            $0.centerY.equalTo(starButton1)
            $0.leading.equalTo(starButton4.snp.trailing).offset(5)
        }
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(satisfactionLabel.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(1)
        }
        
        reviewSubLabel.snp.makeConstraints {
            $0.top.equalTo(lineView.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(20)
        }
        
        idLabel.snp.makeConstraints {
            $0.top.equalTo(reviewSubLabel.snp.bottom)
            $0.leading.equalTo(starButton1)
        }
        
        reviewView.snp.makeConstraints {
            $0.top.equalTo(idLabel.snp.bottom).offset(5)
            $0.leading.equalTo(idLabel)
            $0.width.equalTo(221)
            $0.height.equalTo(67)
        }
        
        reviewLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        
        idLabel2.snp.makeConstraints {
            $0.top.equalTo(reviewView.snp.bottom).offset(5)
            $0.leading.equalTo(starButton1)
        }
        
        reviewView2.snp.makeConstraints {
            $0.top.equalTo(idLabel2.snp.bottom).offset(5)
            $0.leading.equalTo(idLabel2)
            $0.width.equalTo(221)
            $0.height.equalTo(67)
        }
        
        reviewLabel2.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        
        idLabel3.snp.makeConstraints {
            $0.top.equalTo(reviewView2.snp.bottom)
            $0.leading.equalTo(starButton1)
        }
        
        reviewView3.snp.makeConstraints {
            $0.top.equalTo(idLabel3.snp.bottom).offset(5)
            $0.leading.equalTo(idLabel3)
            $0.width.equalTo(221)
            $0.height.equalTo(67)
        }
        
        reviewLabel3.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        

    }

}
