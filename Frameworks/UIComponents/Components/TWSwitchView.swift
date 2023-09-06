//
//  TWSwitchView.swift
//  UIComponents
//
//  Created by Kirill on 06.09.2023.
//

import UIKit
import SnapKit

fileprivate extension Constants {
    static let buttonDividerOffset: CGFloat = 5
}

extension TWSwitchView {
    public enum State {
        case leftIsActive
        case rightIsActive
        
        mutating func togle() {
            self = self == .leftIsActive ? .rightIsActive : .leftIsActive
        }
    }
}

open class TWSwitchView: BaseView {
    
    
    private let firstLabel = UILabel()
    private let separatorView = UILabel()
    private let secondLabel = UILabel()
    private let button = UIButton()
    
    private var animationTimer = Timer()
    private let animationTimeInterval: TimeInterval = 0.4
    private var animationPoint: CGFloat = 0
    
    public var state = State.leftIsActive {
        didSet {
            animateSeparatorView()
            animateSetupState()
        }
    }
    
    public var titles: (firstTitle: String, secondTtitle: String)? = nil {
        didSet {
            self.firstLabel.text = titles?.firstTitle
            self.secondLabel.text = titles?.secondTtitle
        }
    }
    
    override func setup() {
        super.setup()
        UIFont.registerFonts(from: Bundle.uiComponents)
        setupButton()
        setupSeparatorView()
        setupFirstLabel()
        setupSecondLabel()
    }
}

private extension TWSwitchView {
    
    func setupButton() {
        addSubview(button)
        button.addTarget(self, action: #selector(buttonHandler), for: .touchUpInside)
        button.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setupFirstLabel() {
        addSubview(firstLabel)
        firstLabel.font = WTFont.robotoMedium(size: 30)
        firstLabel.layoutMargins.bottom = 0
        firstLabel.textColor = WTColor.title_active()
        firstLabel.snp.makeConstraints {
            $0.bottom.leading.equalToSuperview()
            $0.trailing.equalTo(separatorView.snp.leading).offset(-10)
        }
    }
    
    func setupSeparatorView() {
        addSubview(separatorView)
        separatorView.text = "/"
        separatorView.textColor = R.color.title_active()
        separatorView.font = R.font.robotoMedium(size: 30)
        //прижимает текст к нижней границе
        separatorView.layoutMargins.bottom = 0
        separatorView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
        }
    }
    
    func setupSecondLabel() {
        addSubview(secondLabel)
        secondLabel.font = R.font.robotoRegular(size: 20)
        secondLabel.textColor = R.color.title_inactive()
        secondLabel.layoutMargins.bottom = 0
        secondLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.leading.equalTo(separatorView.snp.trailing).offset(10)
            $0.bottom.equalToSuperview().inset(2.5)
            
        }
    }
}

public extension TWSwitchView {
    @IBAction func buttonHandler() {
        state.togle()
    }
}

private extension TWSwitchView {
    func animateSeparatorView() {
        UIView.animate(withDuration: animationTimeInterval / 4) {
            self.separatorView.alpha = 0.1
        } completion: { _ in
            UIView.animate(withDuration: self.animationTimeInterval / 4, delay: self.animationTimeInterval / 2) {
                self.separatorView.alpha = 1
            }
        }
    }
    
    func animateSetupState() {
        let activeLabel = state == .leftIsActive ? secondLabel : firstLabel
        let inactiveLabel = state == .leftIsActive ? firstLabel : secondLabel
        
        UIView.animate(withDuration: animationTimeInterval) {
            activeLabel.textColor = R.color.title_inactive()
            inactiveLabel.textColor = R.color.title_active()
            
            
            inactiveLabel.snp.remakeConstraints {
                $0.leading.bottom.equalToSuperview()
                $0.trailing.equalTo(self.separatorView.snp.leading).offset(-10)
            }
            activeLabel.snp.remakeConstraints {
                $0.trailing.equalToSuperview()
                $0.leading.equalTo(self.separatorView.snp.trailing).offset(10)
                $0.bottom.equalToSuperview().inset(2.5)
            }
            self.layoutIfNeeded()
            
        }
        
        animationTimer.invalidate()
        animationTimer = Timer.scheduledTimer(withTimeInterval: animationTimeInterval / 25, repeats: true, block: { timer in
            if self.animationPoint < 10 {
                self.animationPoint += 0.4
                let inactiveSize = 20 + self.animationPoint
                inactiveLabel.font = inactiveSize > 25 ? R.font.robotoMedium(size: inactiveSize) : R.font.robotoRegular(size: inactiveSize)
                
                let activeSize = 30 - self.animationPoint
                activeLabel.font = activeSize > 25 ? R.font.robotoRegular(size: activeSize) : R.font.robotoMedium(size: activeSize)
            }else{
                timer.invalidate()
                self.animationPoint = 0
            }
        })
    }
}
