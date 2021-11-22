//
//  ResultTypeCell.swift
//  DuckWorkEqual
//
//  Created by 권준상 on 2021/11/22.
//

import UIKit
import SnapKit

class ResultTypeCell: UITableViewCell {
    
    let dotLabel = UILabel().then {
        $0.text = "●"
        $0.font = .systemFont(ofSize: 5, weight: .bold)
        $0.textColor = .black
    }
    
    let typeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 17, weight: .bold)
        $0.textColor = .black
    }
    
    let exampleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .black
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
        contentView.addSubviews(dotLabel, typeLabel, exampleLabel)
    }

    private func setConstraints() {
        contentView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        dotLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(25)
            $0.leading.equalToSuperview().offset(40)
        }
        
        typeLabel.snp.makeConstraints {
            $0.centerY.equalTo(dotLabel)
            $0.leading.equalTo(dotLabel.snp.trailing).offset(10)
        }

        exampleLabel.snp.makeConstraints {
            $0.top.equalTo(dotLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(50)
        }

    }

    public func setTitle(type: String, example: String) {
        typeLabel.text = type
        exampleLabel.text = example
    }

}
