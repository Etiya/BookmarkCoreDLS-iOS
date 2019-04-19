//
//  BookmarkDLS+UIEdgeInsets.swift
//  AloeStackView
//
//  Created by Murat Yılmaz on 20.02.2019.
//

extension UIEdgeInsets {
    public static let small_LR = UIEdgeInsets(top: 0, left: Spacing.small, bottom: 0, right: Spacing.small)
    public static let small_LRTB = UIEdgeInsets(top: Spacing.small, left: Spacing.small, bottom: Spacing.small, right: Spacing.small)
    public static let tiny_LRTB = UIEdgeInsets(top: Spacing.tiny, left: Spacing.tiny, bottom: Spacing.tiny, right: Spacing.tiny)
    public static let tiny_LR = UIEdgeInsets(top: 0, left: Spacing.tiny, bottom: 0, right: Spacing.tiny)
}

extension UIView {
    
    static func makeSeperator(color: UIColor = .lightGray) -> UIView {
        let seperator = UIView(frame: .zero)
        seperator.backgroundColor = color
        return seperator
    }
    
    func applyShadow(
        apply: Bool,
        color: UIColor = UIColor.black,
        offset: CGSize = CGSize(width: 0.0, height: 0.0),
        opacity: Float = 0.2, radius: Float = 3,
        shadowRect: CGRect? = nil) {
        self.layer.shadowColor = apply ? color.cgColor : UIColor.white.withAlphaComponent(0.0).cgColor
        self.layer.shadowOffset = apply ? offset : CGSize(width: 0.0, height: 0.0)
        self.layer.shadowOpacity = apply ? opacity : 0.0
        self.layer.shadowRadius = apply ? CGFloat(radius) : 0.0
        self.layer.masksToBounds = false
        if let shadowRect = shadowRect {
            self.layer.shadowPath = UIBezierPath(rect: shadowRect).cgPath
        }
    }
    
}
