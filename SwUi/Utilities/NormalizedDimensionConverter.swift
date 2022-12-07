//
//  NormalizedDimensionConverter.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 01.12.2022.
//

import UIKit

// NormalizedDimensionConverter is the same converter functional as has Vision framework
// Created to avoid "import Vision"(whole framework) if you want to use only Converter functional

/// VNNormalizedPointForImagePoint
func getNormalizedPointForPoint(_ point: CGPoint, in size: CGSize) -> CGPoint {
    CGPoint(x: point.x / size.width, y: point.y / size.height)
}

/// VNImagePointForNormalizedPoint
func getPointFromNormalizedPoint(_ point: CGPoint, in size: CGSize) -> CGPoint {
    CGPoint(x: size.width * point.x, y: size.height * point.y)
}

/// The same as getNormalizedPointForPoint(VNNormalizedPointForImagePoint) only for Size
func getNormalizedSizeForSize(_ size: CGSize, in frame: CGSize) -> CGSize {
    CGSize(width: size.width / frame.width, height: size.height / frame.height)
}

/// The same as getPointFromNormalizedPoint(VNImagePointForNormalizedPoint) only for Size
func getSizeFromNormalizedSize(_ size: CGSize, in frame: CGSize) -> CGSize {
    CGSize(width: size.width * frame.width, height: size.height * frame.height)
}

/// VNNormalizedRectForImageRect
func getNormalizedRectForRect(_ rect: CGRect, in size: CGSize) -> CGRect {
    CGRect(
        origin: getNormalizedPointForPoint(rect.origin, in: size),
        size: getNormalizedSizeForSize(rect.size, in: size)
    )
}

/// VNImageRectForNormalizedRect
func getRectFromNormalizedRect(_ rect: CGRect, in size: CGSize) -> CGRect {
    CGRect(
        origin: getPointFromNormalizedPoint(rect.origin, in: size),
        size: getSizeFromNormalizedSize(rect.size, in: size)
    )
}
