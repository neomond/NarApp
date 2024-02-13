//
//  MessageInputView.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 30.01.24.
//

import UIKit
import SnapKit

class MessageInputView: UIView, UITextViewDelegate {
    private let maxCharactersPerSMS = 10
    private let maxSMSSegments = 2
    
    
    private var currentCharacterCount = 0 {
        didSet {
            characterCountLabel.text = "\(currentCharacterCount)"
        }
    }
    
    private var currentSMSSegmentCount = 1 {
        didSet {
            smsCounterLabel.text = "SMS sayı: \(currentSMSSegmentCount)/\(maxSMSSegments)"
        }
    }
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var placeholderLabel: UILabel = {
        let label = UILabel()
        label.text = "Mesaj daxil edin..."
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.delegate = self
        textView.isScrollEnabled = false
        textView.textContainerInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 12)
        textView.backgroundColor = .white
        return textView
        
    }()
    
    private lazy var smsCounterLabel: UILabel = {
        let label = UILabel()
        label.text = "SMS sayı: 1/2"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.textAlignment = .left
        return label
    }()
    
    private lazy var characterCountLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.textAlignment = .right
        return label
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
        addSubview(containerView)
        containerView.addSubview(textView)
        containerView.addSubview(placeholderLabel)
        containerView.addSubview(smsCounterLabel)
        containerView.addSubview(characterCountLabel)
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        placeholderLabel.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(16)
        }
        
        textView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(8)
            make.bottom.equalTo(smsCounterLabel.snp.top).offset(-8)
            make.height.greaterThanOrEqualTo(100)
        }
        
        smsCounterLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        characterCountLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
    
    // MARK: - UITextViewDelegate Methods
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
        characterCountLabel.text = "\(textView.text.count)"
        validateMessage()
        print("Entered Message: \(textView.text ?? "")")
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
    
    
    // MARK: - Validation
    private func validateMessage() {
        let text = textView.text ?? ""
        currentCharacterCount = text.count
        currentSMSSegmentCount = (currentCharacterCount / maxCharactersPerSMS) + (currentCharacterCount % maxCharactersPerSMS > 0 ? 1 : 0)
        
        if currentSMSSegmentCount > maxSMSSegments || currentCharacterCount > maxCharactersPerSMS * maxSMSSegments {
            characterCountLabel.textColor = .red
            smsCounterLabel.textColor = .red
        } else {
            characterCountLabel.textColor = .lightGray
            smsCounterLabel.textColor = .lightGray
        }
    }
    
    
}



