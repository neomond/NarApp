
import UIKit

class DashboardView: UIView {
    // MARK: - Product Card Main View
    
    private lazy var externalView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorStyle.bgColor.load()
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
    // MARK: - Product Card Container View
    lazy var productCardContainerView: ProductCardContainerView = {
        let view = ProductCardContainerView()
        return view
    }()
    
    // MARK: - Services Grid View
    lazy var servicesView: ServicesView = {
        let view = ServicesView()
        return view
    }()
    
    // MARK: - Stories Collection View
    lazy var storiesCollectionView: StoriesCollectionView = {
        let collectionView = StoriesCollectionView()
        collectionView.register(StoryCircleCell.self, forCellWithReuseIdentifier: StoryCircleCell.reuseIdentifier)
        collectionView.isHidden = true
        return collectionView
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
         indicator.hidesWhenStopped = true
         return indicator
     }()
    
   private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16
        return view
    }()
    
    private func setupSubviews() {
        self.containerView.addSubview(stackView)
        self.stackView.addArrangedSubview(storiesCollectionView)
        self.stackView.addArrangedSubview(activityIndicator)
        self.stackView.addArrangedSubview(productCardContainerView)
        self.stackView.addArrangedSubview(servicesView)

        self.scrollView.addSubview(containerView)
        self.externalView.addSubview(scrollView)
        self.addSubview(externalView)
    }
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = ColorStyle.mainColor.load()
        setupSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addConstraints() {
        externalView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.86)
            make.top.equalTo(UIScreen.main.bounds.height * 0.14)
        }
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(self.scrollView)
        }
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.leading.trailing.bottom.equalToSuperview()
        }
        storiesCollectionView.snp.makeConstraints { make in
            make.height.equalTo(80)
        }
    }
    
    //MARK: public
    public func startStoriesLoading() {
        self.activityIndicator.startAnimating()
    }
    public func stopStoriesLoading() {
        self.activityIndicator.stopAnimating()
        self.storiesCollectionView.isHidden = false
    }
}





