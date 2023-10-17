//
//  RichTextViewComponent+Alignment.swift
//  RichTextKit
//
//  Created by Daniel Saidi on 2022-05-29.
//  Copyright © 2022-2023 Daniel Saidi. All rights reserved.
//

import Foundation

#if canImport(UIKit)
import UIKit
#endif

#if canImport(AppKit)
import AppKit
#endif

public extension RichTextViewComponent {

    /// Get the current text alignment.
    var currentTextAlignment: RichTextAlignment? {
        let attribute: NSMutableParagraphStyle? = currentRichTextAttribute(.paragraphStyle)
        guard let style = attribute else { return nil }
        return RichTextAlignment(style.alignment)
    }

    /// Set the current text alignment.
    func setCurrentTextAlignment(
        _ alignment: RichTextAlignment
    ) {
        if !hasTrimmedText {
            return setTextAlignmentAtCurrentPosition(to: alignment)
        }
        setRichTextAlignment(alignment, at: selectedRange)
    }
}

private extension RichTextViewComponent {

    func setTextAlignmentAtCurrentPosition(
        to alignment: RichTextAlignment
    ) {
        let style = NSMutableParagraphStyle()
        style.alignment = alignment.nativeAlignment
        var attributes = currentRichTextAttributes
        attributes[.paragraphStyle] = style
        typingAttributes = attributes
    }
}
