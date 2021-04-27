import UIKit

enum AnchorPosition {
    case top
    case bottom
    case left
    case right
}

enum AnchorOrientation {
    case horizontal
    case vertical
}

extension UIView {
    
    func above(to view: UIView, constant: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
                
        bottomAnchor.constraint(equalTo: view.topAnchor, constant: constant).isActive = true
    }
    
    func bellow(to view: UIView, constant: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
                
        topAnchor.constraint(equalTo: view.bottomAnchor, constant: constant).isActive = true
    }
    
    func right(to view: UIView, constant: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
                
        leftAnchor.constraint(equalTo: view.rightAnchor, constant: constant).isActive = true
    }
    
    func left(to view: UIView, constant: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
                
        rightAnchor.constraint(equalTo: view.leftAnchor, constant: constant).isActive = true
    }
    
    func pin(to view: UIView, sides: [AnchorPosition] = [.top, .bottom, .left, .right], constant: CGFloat = 0) {
                
        translatesAutoresizingMaskIntoConstraints = false
        
        if sides.contains(.left) {
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant).isActive = true
        }
        
        if sides.contains(.right) {
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constant).isActive = true
        }
        
        if sides.contains(.top) {
            topAnchor.constraint(equalTo: view.topAnchor, constant: constant).isActive = true
        }
        
        if sides.contains(.bottom) {
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constant).isActive = true
        }
    }
    
    func pinGreaterThanOrEqualTo(to view: UIView, sides: [AnchorPosition] = [.top, .bottom, .left, .right], constant: CGFloat = 0) {
                
        translatesAutoresizingMaskIntoConstraints = false
        
        if sides.contains(.left) {
            leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: constant).isActive = true
        }
        
        if sides.contains(.right) {
            trailingAnchor.constraint(greaterThanOrEqualTo: view.trailingAnchor, constant: -constant).isActive = true
        }
        
        if sides.contains(.top) {
            topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor, constant: constant).isActive = true
        }
        
        if sides.contains(.bottom) {
            bottomAnchor.constraint(greaterThanOrEqualTo: view.bottomAnchor, constant: -constant).isActive = true
        }
    }
    
    func pinLessThanOrEqualTo(to view: UIView, sides: [AnchorPosition] = [.top, .bottom, .left, .right], constant: CGFloat = 0) {
                
        translatesAutoresizingMaskIntoConstraints = false
        
        if sides.contains(.left) {
            leadingAnchor.constraint(lessThanOrEqualTo: view.leadingAnchor, constant: constant).isActive = true
        }
        
        if sides.contains(.right) {
            trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -constant).isActive = true
        }
        
        if sides.contains(.top) {
            topAnchor.constraint(lessThanOrEqualTo: view.topAnchor, constant: constant).isActive = true
        }
        
        if sides.contains(.bottom) {
            bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -constant).isActive = true
        }
    }
    
    func pinToSuperview(sides: [AnchorPosition] = [.top, .bottom, .left, .right], constant: CGFloat = 0) {
        
        guard let parentView = self.superview else { return }
        
        pin(to: parentView, sides: sides, constant: constant)
    }
    
    func pin(to layoutGuide: UILayoutGuide, sides: [AnchorPosition] = [.top, .bottom, .left, .right], constant: CGFloat = 0) {
                
        translatesAutoresizingMaskIntoConstraints = false
        
        if sides.contains(.left) {
            leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: constant).isActive = true
        }
        
        if sides.contains(.right) {
            trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -constant).isActive = true
        }
        
        if sides.contains(.top) {
            topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: constant).isActive = true
        }
        
        if sides.contains(.bottom) {
            bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: -constant).isActive = true
        }
    }
    
    func center(to view: UIView) {
                
        centerHorizontal(to: view)
        centerVertical(to: view)
    }
    
    func centerToSuperview() {
                
        centerHorizontalToSuperview()
        centerVerticalToSuperview()
    }
    
    func centerHorizontalToSuperview() {
        
        guard let parentView = self.superview else { return }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        centerXAnchor.constraint(equalTo: parentView.centerXAnchor).isActive = true
    }
    
    func centerVerticalToSuperview() {
        
        guard let parentView = self.superview else { return }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        centerYAnchor.constraint(equalTo: parentView.centerYAnchor).isActive = true
    }
    
    func centerHorizontal(to view: UIView, constant: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant).isActive = true
    }
    
    func centerVertical(to view: UIView, constant: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
    }
    
    func height(equalToConstant height: CGFloat) {
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func width(equalToConstant width: CGFloat) {
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func height(equalTo view: UIView) {
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func width(equalTo view: UIView) {
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
    
    func height(equalTo view: UIView, constant: CGFloat = 0) {
        heightAnchor.constraint(equalTo: view.heightAnchor, constant: constant).isActive = true
    }
    
    func width(equalTo view: UIView, constant: CGFloat = 0) {
        widthAnchor.constraint(equalTo: view.widthAnchor, constant: constant).isActive = true
    }
}
