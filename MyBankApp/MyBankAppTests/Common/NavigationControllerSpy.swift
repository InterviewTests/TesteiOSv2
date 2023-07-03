import UIKit

final class NavigationControllerSpy: UINavigationController {
    enum Methods: Equatable {
        case show(UIViewController, Any?)
        case presentViewController(UIViewController, animated: Bool)
        case popToViewController(UIViewController, animated: Bool)
        case pushViewController(UIViewController, animated: Bool)
        case popToRootViewController(animated: Bool)
        case popViewController(animated: Bool)
        case dismiss(animated: Bool)
        case setViewControllers([UIViewController], animated: Bool)
        // MARK: View Type Helpers
        case presentViewControllerType(UIViewController.Type, animated: Bool)
        case popToViewControllerType(UIViewController.Type, animated: Bool)
        case pushViewControllerType(UIViewController.Type, animated: Bool)
    }
    
    private(set) var calledMethods: [Methods] = []
    private func called(_ method: Methods) {
        calledMethods.append(method)
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    public override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        nil
    }
    
    // MARK: - pushViewController
    public override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        called(.pushViewController(viewController, animated: animated))
        super.pushViewController(viewController, animated: animated)
    }
    
    // MARK: - popToRootViewController
    public var popToRootViewControllerViewControllersToBeReturned: [UIViewController]?
    public override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        called(.popToRootViewController(animated: animated))
        return popToRootViewControllerViewControllersToBeReturned
    }
    
    // MARK: - setViewControllers
    public var setViewControllersToBeReturned: [UIViewController]?
    public override func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        super.setViewControllers(viewControllers, animated: animated)
        called(.setViewControllers(viewControllers, animated: animated))
        setViewControllersToBeReturned = viewControllers
    }
    
    // MARK: - popViewController
    public var popViewControllerToBeReturned: UIViewController?
    public override func popViewController(animated: Bool) -> UIViewController? {
        called(.popViewController(animated: animated))
        return popViewControllerToBeReturned
    }
    
    // MARK: - show
    public override func show(_ vc: UIViewController, sender: Any?) {
        called(.show(vc, sender))
    }
    
    // MARK: - popToViewController
    public var popToViewControllersToBeReturned: [UIViewController]?
    public override func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        called(.popToViewController(viewController, animated: animated))
        return popToViewControllersToBeReturned
    }
    
    // MARK: - present
    public override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        called(.presentViewController(viewControllerToPresent, animated: flag))
        completion?()
    }
    
    // MARK: - dismiss
    public override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        called(.dismiss(animated: flag))
        completion?()
    }
}

extension NavigationControllerSpy.Methods {
    static func == (_ lhs: Self, _ rhs: Self) -> Bool {
        switch (lhs, rhs) {
        case let (.presentViewControllerType(vcType, lhsA), .presentViewController(vc, rhsA)),
             let (.popToViewControllerType(vcType, lhsA), .popToViewController(vc, rhsA)),
             let (.pushViewControllerType(vcType, lhsA), .pushViewController(vc, rhsA)),
             let (.presentViewController(vc, lhsA), .presentViewControllerType(vcType, rhsA)),
             let (.popToViewController(vc, lhsA), .popToViewControllerType(vcType, rhsA)),
             let (.pushViewController(vc, lhsA), .pushViewControllerType(vcType, rhsA)):
            return lhsA == rhsA && String(describing: vc.classForCoder) == String(describing: vcType)
        case let (.presentViewControllerType(lhsT, lhsA), .presentViewControllerType(rhsT, rhsA)),
             let (.popToViewControllerType(lhsT, lhsA), .popToViewControllerType(rhsT, rhsA)),
             let (.pushViewControllerType(lhsT, lhsA), .pushViewControllerType(rhsT, rhsA)):
            return lhsA == rhsA && String(describing: lhsT) == String(describing: rhsT)
        case let (.presentViewController(lhsVC, lhsA), .presentViewController(rhsVC, rhsA)),
             let (.popToViewController(lhsVC, lhsA), .popToViewController(rhsVC, rhsA)),
             let (.pushViewController(lhsVC, lhsA), .pushViewController(rhsVC, rhsA)):
            return lhsVC == rhsVC && lhsA == rhsA
        case let (.popToRootViewController(lhs), .popToRootViewController(rhs)),
             let (.popViewController(lhs), .popViewController(rhs)),
             let (.dismiss(lhs), .dismiss(rhs)):
            return lhs == rhs
        default:
            return false
        }
    }
}
