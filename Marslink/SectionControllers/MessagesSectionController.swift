//
//  MessagesSectionController.swift
//  Marslink
//
//  Created by Shabir Jan on 09/02/2017.
//  Copyright © 2017 Ray Wenderlich. All rights reserved.
//

import UIKit
import IGListKit
class MessagesSectionController: IGListSectionController {
    var message: Message!
    
    override init(){
        super.init()
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
        
    }
}
extension MessagesSectionController : IGListSectionType{
    func numberOfItems() -> Int {
        return 1
    }
    func sizeForItem(at index: Int) -> CGSize {
        guard let contenxt = collectionContext
            else {
            return .zero
        }
        return MessageCell.cellSize(width: contenxt.containerSize.width, text: message.text)
    }
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext?.dequeueReusableCell(of: MessageCell.self, for: self, at: index) as! MessageCell
        cell.messageLabel.text = message.text
        cell.titleLabel.text = message.user.name.uppercased()
        return cell
    }
    func didUpdate(to object: Any) {
        message = object as? Message
    }
    func didSelectItem(at index: Int) {
        
    }
}
