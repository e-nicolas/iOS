//
//  HTMLString.swift
//
//  Created by Emmanouil Nicolas Papadimitropoulos on 30/01/17.
//

import Foundation

extension String {
    
    //HTML
    func hasHTMLTag() -> Bool {
        let regex = try! NSRegularExpression(pattern: "<[^>]+>", options: [.caseInsensitive])
        
        return (regex.firstMatch(in: self, options:[], range: NSMakeRange(0, utf16.count)) != nil)
    }
    func deleteHTMLTags() -> String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    
	/*
	 * AttributedString
	 * useColor (default text color)
	 * useSize  (default text size)
	 */
    func attributtedHTMLText(useColor:UIColor?, useSize:CGFloat?) -> NSAttributedString {
        
		//Properties
        var sizeString = ""
        if useSize != nil {
            sizeString = "size=\"\(round(useSize!/3.6))\""
        }
        var colorString = ""
        if useColor != nil {
            colorString = "color=\"\(useColor!.hexString())\""
        }
		
		//For default text properties 
        let string = "<font \(colorString) \(sizeString)>\(self)</font>"
        let attrStr = try! NSAttributedString(
            data: (string.data(using: String.Encoding.unicode, allowLossyConversion: true)!),
            options: [ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
            documentAttributes: nil)        
		
        let newString = NSMutableAttributedString(attributedString: attrStr)
        attrStr.enumerateAttributes(in: NSRange.init(location: 0, length: attrStr.length), options: .reverse, using: { (attributes, range, pointer) in
            if let attribute = attributes[NSFontAttributeName] {
                if let font = attribute as? UIFont {
                    
                    let traits = font.fontDescriptor.symbolicTraits
                    let descriptor = UIFont.systemFont(ofSize: 12).fontDescriptor.withSymbolicTraits(traits)
                    
                    let newFont = UIFont(descriptor: descriptor!, size: font.pointSize)
                    newString.removeAttribute(NSFontAttributeName, range: range)
                    newString.addAttribute(NSFontAttributeName, value: newFont, range: range)
                    
                }
            }
        })
        
        return newString
    }
}
