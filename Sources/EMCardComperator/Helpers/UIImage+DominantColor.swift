//
//  UIImage+DominantColor.swift
//  EMCardComperator
//
//  Created by Eyüp MERT on 7.04.2025.
//

import UIKit
import SwiftUI

extension UIImage {
    func dominantColor() -> UIColor? {
        guard let cgImage = self.cgImage else { return nil }

        let width = 10
        let height = 10
        let size = CGSize(width: width, height: height)

        let context = CGContext(
            data: nil,
            width: width,
            height: height,
            bitsPerComponent: 8,
            bytesPerRow: width * 4,
            space: CGColorSpaceCreateDeviceRGB(),
            bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue
        )

        guard let context = context else { return nil }
        context.draw(cgImage, in: CGRect(origin: .zero, size: size))

        guard let pixelData = context.data else { return nil }
        let data = pixelData.bindMemory(to: UInt8.self, capacity: width * height * 4)

        var colorCount: [UIColor: Int] = [:]

        for x in 0..<width {
            for y in 0..<height {
                let index = (x + y * width) * 4
                let r = CGFloat(data[index]) / 255.0
                let g = CGFloat(data[index + 1]) / 255.0
                let b = CGFloat(data[index + 2]) / 255.0
                
                // Ignore near-white colors (adjust threshold if needed)
                let threshold: CGFloat = 0.9
                if r > threshold && g > threshold && b > threshold {
                    continue
                }

                let color = UIColor(red: r, green: g, blue: b, alpha: 1)
                colorCount[color, default: 0] += 1
            }
        }

        return colorCount.max { $0.value < $1.value }?.key
    }
}

/// Image Utility class with functions related to image processing
public class ImageUtils {
    public static func loadImage(named imageName: String) -> UIImage? {
        let bundle = Bundle.module
        return UIImage(named: imageName, in: bundle, with: nil)
    }

    public static func extractDominantColor(from image: UIImage) -> Color {
        guard let dominantColor = image.dominantColor() else {
            return .clear
        }
        return Color(uiColor: dominantColor)
    }
}
