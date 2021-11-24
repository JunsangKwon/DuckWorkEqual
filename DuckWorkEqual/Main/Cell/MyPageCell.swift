//
//  MyPageCell.swift
//  DuckWorkEqual
//
//  Created by 권준상 on 2021/11/24.
//

import UIKit

class MyPageCell: UITableViewCell {
    
    let iconImageView = UIImageView()
    
    let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .black
    }
    
    let rightImageView = UIImageView().then {
        $0.image = UIImage(named: "greyRight")
    }
    
    let lineView = UIView().then {
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
        contentView.addSubviews(iconImageView, titleLabel, rightImageView, lineView)
    }

    private func setConstraints() {
        contentView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        iconImageView.snp.makeConstraints {
            $0.width.height.equalTo(25)
            $0.leading.equalToSuperview().offset(20)
            $0.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalTo(iconImageView)
            $0.leading.equalTo(iconImageView.snp.trailing).offset(10)
            $0.centerY.equalToSuperview()
        }

        rightImageView.snp.makeConstraints {
            $0.centerY.equalTo(iconImageView)
            $0.width.height.equalTo(20)
            $0.trailing.equalToSuperview().offset(-30)
        }
        
        lineView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(1)
        }

    }

    public func setTitle(title: String, imageName: String) {
        titleLabel.text = title
        iconImageView.image = UIImage(named: imageName)
    }

}

