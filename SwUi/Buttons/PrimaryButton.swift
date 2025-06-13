//
//  PrimaryButton.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 13.06.2025.
//

import SwiftUI

@available(iOS 17.0, *)
struct PrimaryButton<T: View>: View {
    
    let content: T
    var action: () -> Void
    
    init(_ title: String, action: @escaping () -> Void) where T == Text {
        self.action = action
        self._isLoading = .constant(false)
        self._isDisabled = .constant(false)
        
        self.content = Text(title)
            .font(font)
    }
    
    init(
        action: @escaping () -> Void,
        @ViewBuilder content: @escaping () -> T
    ) {
        self.content = content()
        self.action = action
        self._isLoading = .constant(false)
        self._isDisabled = .constant(false)
    }
    
    @Binding private var isLoading: Bool
    @Binding private var isDisabled: Bool
    
    private var animate: Bool = true
    @State private var labelScale: CGFloat = 1
    @State private var loadingScale: CGFloat = 0
    @State private var disableOpacity: CGFloat = 1
    
    private var isExpandable: Bool = true
    private var height: CGFloat = 58
    
    private var fgColor: Color = .white
    private var bgColor: Color = .blue
    
    private var progressColor: Color = .white
    
    private var font: Font = .system(size: 16, weight: .semibold)
    
    var body: some View {
        Button(action: action, label: label)
            .disabled(isDisabled || isLoading)
            .opacity(disableOpacity)
            .onChange(of: isLoading, initial: true) { oldValue, newValue in
                if oldValue == newValue {
                    setLoading(newValue, animate: false)
                } else {
                    setLoading(newValue, animate: animate)
                }
            }
            .onChange(of: isDisabled, initial: true) { oldValue, newValue in
                if oldValue == newValue {
                    setDisabled(newValue, animate: false)
                } else {
                    setDisabled(newValue, animate: animate)
                }
            }
    }
    
    @ViewBuilder
    func label() -> some View {
        ZStack {
            if isExpandable {
                bgColor
                contentView
            } else {
                contentView
                    .frame(height: height)
                    .padding(.horizontal)
                    .background(bgColor)
            }
        }
        .frame(height: height)
        .clipShape(.rect(cornerRadius: 15))
    }
    
    @ViewBuilder
    private var contentView: some View {
        ZStack {
            content
                .foregroundStyle(fgColor)
                .scaleEffect(labelScale)
                .opacity(labelScale)
            
            ProgressView()
                .tint(progressColor)
                .scaleEffect(loadingScale)
                .opacity(loadingScale)
        }
    }
    
    // MARK: - Functions
    private func setLoading(_ isLoading: Bool, animate: Bool) {
        if isLoading {
            if animate {
                withAnimation(.easeOut) {
                    labelScale = 0
                }
                
                withAnimation(.easeOut) {
                    loadingScale = 1
                }
            } else {
                labelScale = 0
                loadingScale = 1
            }
        } else {
            if animate {
                withAnimation(.easeOut) {
                    loadingScale = 0
                }
                
                withAnimation(.easeOut) {
                    labelScale = 1
                }
            } else {
                loadingScale = 0
                labelScale = 1
            }
        }
    }
    
    private func setDisabled(_ isDisabled: Bool, animate: Bool) {
        if isDisabled {
            if animate {
                withAnimation(.easeOut) {
                    disableOpacity = 0.6
                }
            } else {
                disableOpacity = 0.6
            }
        } else {
            if animate {
                withAnimation(.easeOut) {
                    disableOpacity = 1
                }
            } else {
                disableOpacity = 1
            }
        }
    }
    
    // MARK: - Modifiers
    func isLoading(_ isLoading: Bool, animate: Bool = true) -> PrimaryButton {
        var view = self
        view.animate = animate
        view._isLoading = .constant(isLoading)
        return view
    }
    
    func disabled(_ isDisabled: Bool, animate: Bool = true) -> PrimaryButton {
        var view = self
        view.animate = animate
        view._isDisabled = .constant(isDisabled)
        return view
    }
    
    func relativeWidth() -> PrimaryButton {
        var view = self
        view.isExpandable = false
        return view
    }
    
    func height(_ height: CGFloat) -> PrimaryButton {
        var view = self
        view.height = height
        return view
    }
    
    func foregroundColor(_ fgColor: Color) -> PrimaryButton {
        var view = self
        view.fgColor = fgColor
        return view
    }
    
    func backgroundColor(_ bgColor: Color) -> PrimaryButton {
        var view = self
        view.bgColor = bgColor
        return view
    }
}

@available(iOS 17.0, *)
#Preview {
    @Previewable @State var isLoading: Bool = false
    @Previewable @State var isDisabled: Bool = false
    
    VStack {
        PrimaryButton("Done") {
            isLoading.toggle()
            isDisabled.toggle()
        }
        
        PrimaryButton("Continue Animation") { isLoading.toggle()  }
            .isLoading(isLoading)
        
        PrimaryButton("Continue Animation MAN") { isLoading.toggle()  }
            .isLoading(true)
        
        PrimaryButton("Continue NO ANIM") { isLoading.toggle()  }
            .isLoading(isLoading, animate: false)
        
        PrimaryButton("Continue REL W") { isLoading.toggle()  }
            .isLoading(isLoading)
            .relativeWidth()
        
        PrimaryButton("Continue Disabled") { isLoading.toggle()  }
            .disabled(isDisabled)
        
        PrimaryButton("Continue Disabled MAN") { isLoading.toggle()  }
            .disabled(true)
        
        PrimaryButton {
            isLoading.toggle()
        } content: {
            HStack(spacing: 12) {
                Text("Create Your First Trip")
                    .font(.system(size: 16, weight: .semibold))
                
                Image(systemName: "star.fill")
            }
            .foregroundColor(.white)
        }
        .isLoading(isLoading)
        
        PrimaryButton("Custom height") {
            isLoading.toggle()
        }
        .height(90)
    }
    .padding()
}
