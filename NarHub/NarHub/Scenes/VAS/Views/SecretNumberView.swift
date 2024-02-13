import UIKit
import NarHubNetworkKit
import SnapKit

class SecretNumberView: UIView {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Gizli nömrə"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Gizli zəng üçün"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    private lazy var subscriptionInfoLabel: UILabel = {
        let label = UILabel()
        let mainText = "30 günlük "
        let grayText = "/ 0,10 ₼"
        let mainTextAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 18),
            .foregroundColor: UIColor.black
        ]
        
        let grayTextAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16),
            .foregroundColor: ColorStyle.labelColor.load() as Any
        ]
        let attributedString = NSMutableAttributedString(string: mainText, attributes: mainTextAttributes)
        let grayAttributedString = NSAttributedString(string: grayText, attributes: grayTextAttributes)
        
        attributedString.append(grayAttributedString)
        label.attributedText = attributedString
        return label
    }()
    
    
    
    private lazy var serviceSwitch: UISwitch = {
        let switchControl = UISwitch()
        switchControl.onTintColor = ColorStyle.mainColor.load()
        return switchControl
    }()
    
    private lazy var renewalInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Yenilənməyə qalıb"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    private lazy var renewalInfoLabelData: UILabel = {
        let label = UILabel()
        label.text = "27 gün"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = ColorStyle.dataLabel.load()
        return label
    }()
    
    private lazy var renewalDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = ColorStyle.dataLabel.load()
        return label
    }()
    
    private lazy var secretNumberContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var progressBar: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.trackTintColor = ColorStyle.graySecondary.load()
        progressView.progressTintColor = ColorStyle.mainColor.load()
        progressView.setProgress(0.47, animated: true)
        return progressView
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupViews() {
        addSubview(secretNumberContainerView)
        secretNumberContainerView.addSubview(titleLabel)
        secretNumberContainerView.addSubview(subTitleLabel)
        secretNumberContainerView.addSubview(subscriptionInfoLabel)
        secretNumberContainerView.addSubview(serviceSwitch)
        secretNumberContainerView.addSubview(renewalInfoLabel)
        secretNumberContainerView.addSubview(renewalInfoLabelData)
        secretNumberContainerView.addSubview(renewalDateLabel)
        secretNumberContainerView.addSubview(progressBar)
    }
    
    private func setupConstraints() {
        secretNumberContainerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(16)
        }
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(16)
        }
        subscriptionInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(28)
            make.left.equalToSuperview().offset(16)
        }
        serviceSwitch.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalTo(subscriptionInfoLabel.snp.centerY)
        }
        renewalInfoLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalTo(subscriptionInfoLabel.snp.bottom).offset(28)
        }
        renewalInfoLabelData.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalTo(renewalInfoLabel.snp.centerY)
        }
        progressBar.snp.makeConstraints { make in
            make.top.equalTo(renewalInfoLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        renewalDateLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalTo(progressBar.snp.bottom).offset(14)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
}


extension SecretNumberView {
    func configureView(with item: VASModel) {
        titleLabel.text = item.title
        subTitleLabel.text = item.desc
        subscriptionInfoLabel.text = "\(item.amountMonthly) / \(item.amount) ₼"
        serviceSwitch.isOn = item.isSwitch
        renewalInfoLabelData.text = item.renewalDate
        renewalDateLabel.text = "\(item.nextRenewalDate)"
        progressBar.setProgress(Float(item.progressValue), animated: true)
        
        let mainText = "\(item.amountMonthly) "
        let amountText = "/ \(item.amount) ₼"
        let mainTextAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 18),
            .foregroundColor: UIColor.black
        ]
        let amountTextAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16),
            .foregroundColor: UIColor.gray
        ]
        
        let attributedString = NSMutableAttributedString(string: mainText, attributes: mainTextAttributes)
        let grayAttributedString = NSAttributedString(string: amountText, attributes: amountTextAttributes)
        
        attributedString.append(grayAttributedString)
        subscriptionInfoLabel.attributedText = attributedString
    }
}

