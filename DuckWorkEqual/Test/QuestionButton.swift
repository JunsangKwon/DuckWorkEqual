//
//  File.swift
//  DuckWorkEqual
//
//  Created by 권준상 on 2021/11/21.
//

import Foundation
import UIKit

class QuestionButton : UIButton {

    override var isSelected: Bool {
        didSet{
            if self.isSelected {
                self.tintColor = UIColor.colorWithRGBHex(hex: 0x4D86F5)
            }
            else{
                self.tintColor = UIColor.colorWithRGBHex(hex: 0xF4F3F3)
            }
        }
    }

}
