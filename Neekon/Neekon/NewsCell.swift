//
//  NewsCell.swift
//  Neekon
//
//  Created by Eiman Zolfaghari on 1/27/15.
//  Copyright (c) 2015 Iranican Inc. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    let titleLabel = UILabel()
    let contentLabel = UILabel()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clearColor()
        titleLabel.text = ""
        titleLabel.numberOfLines = 1
        titleLabel.font = UIFont(name: "HelveticaNeue", size: 30)
        
        contentLabel.text = ""
        contentLabel.numberOfLines = 0
        contentLabel.font = UIFont(name: "HelveticaNeue", size: 14)
        
        self.addSubview(titleLabel)
        self.addSubview(contentLabel)

    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        titleLabel.frame = CGRectMake(MARGIN, MARGIN, self.frame.size.width - MARGIN * 2, 35)
        let sizeThatFits = contentLabel.sizeThatFits(CGSize(width: frame.size.width - MARGIN * 2, height: CGFloat(FLT_MAX)))
        contentLabel.frame = CGRectMake(MARGIN, MARGIN + titleLabel.frame.size.height + MARGIN, sizeThatFits.width, sizeThatFits.height)
    }
    
    class func getHeightGivenContent(content: String, width: CGFloat) -> CGFloat {
        var height = MARGIN + 35.0 + MARGIN
        
        let contentLabel = UILabel()
        contentLabel.text = content
        contentLabel.numberOfLines = 0
        contentLabel.font = UIFont(name: "HelveticaNeue", size: 14)

        let sizeThatFits = contentLabel.sizeThatFits(CGSize(width: width, height: CGFloat(FLT_MAX)))
        
        height += sizeThatFits.height + MARGIN
        
        return height
    }
    
    func fill(title: NSString, content: NSString) {
        titleLabel.text = title
        contentLabel.text = content
        updateConstraints()
    }
}
