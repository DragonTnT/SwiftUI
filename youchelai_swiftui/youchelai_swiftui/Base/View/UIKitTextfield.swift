//
//  UIKitTextfield.swift
//  youchelai_swiftui
//
//  Created by longfan on 2022/12/11.
//

import UIKit
import SwiftUI

/* 由UIkit实现的Textfield，可以使用UITextfield有，而SwiftUI中Textfield没有的功能
 如：中文输入时，拼音未变为汉字时，不调用`textFieldDidChangeSelection`
 */
/// 由UIkit实现的Textfield
struct UIKitTextField: UIViewRepresentable {
  var titleKey: String
  @Binding var text: String

  public init(_ titleKey: String, text: Binding<String>) {
    self.titleKey = titleKey
    self._text = text
  }

  func makeUIView(context: Context) -> UITextField {
    let textField = UITextField(frame: .zero)
    textField.delegate = context.coordinator
    textField.setContentHuggingPriority(.defaultHigh, for: .vertical)
    textField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    textField.placeholder = NSLocalizedString(titleKey, comment: "")

    return textField
  }

  func updateUIView(_ uiView: UITextField, context: Context) {
    if text != uiView.text {
        uiView.text = text
    }
  }

  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }

  final class Coordinator: NSObject, UITextFieldDelegate {
    var parent: UIKitTextField

    init(_ textField: UIKitTextField) {
      self.parent = textField
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
      guard textField.markedTextRange == nil, parent.text != textField.text else {
        return
      }
      parent.text = textField.text ?? ""
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      textField.resignFirstResponder()
      return true
    }
  }
}
