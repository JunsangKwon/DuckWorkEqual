//
//  CommunityCell.swift
//  DuckWorkEqual
//
//  Created by 권준상 on 2021/11/25.
//

import UIKit
import SnapKit

class CommunityCell: UITableViewCell {
        
    let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .bold)
        $0.textColor = .black
    }
    
    let contentLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .black
    }
    
    let timeLabel = UILabel().then {
        $0.text = "31분 전"
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .black
    }
    
    let vLineView = UIView().then {
        $0.backgroundColor = UIColor.colorWithRGBHex(hex: 0xF4F3F3)
    }
    
    let writerLabel = UILabel().then {
        $0.text = "익명"
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .black
    }
    
    let hLineView = UIView().then {
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
        contentView.addSubviews(titleLabel, contentLabel, timeLabel, vLineView, writerLabel, hLineView)
    }

    private func setConstraints() {
        contentView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(80)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.trailing.equalToSuperview().inset(15)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(15)
        }

        timeLabel.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(15)
        }
        
        vLineView.snp.makeConstraints {
            $0.centerY.equalTo(timeLabel)
            $0.leading.equalTo(timeLabel.snp.trailing).offset(5)
            $0.width.equalTo(2)
            $0.height.equalTo(10)
        }
        
        writerLabel.snp.makeConstraints {
            $0.centerY.equalTo(timeLabel)
            $0.leading.equalTo(vLineView.snp.trailing).offset(5)
        }
        
        hLineView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }

    }

    public func setTitle(title: String, content: String) {
        titleLabel.text = title
        contentLabel.text = content
    }

}
