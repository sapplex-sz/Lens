import SwiftUI
import UIKit
import UniformTypeIdentifiers
import WebKit

struct LensWebView: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences.allowsContentJavaScript = true
        config.preferences.javaScriptCanOpenWindowsAutomatically = false
        config.websiteDataStore = .default()
        config.setURLSchemeHandler(context.coordinator, forURLScheme: "lens")

        let webView = WKWebView(frame: .zero, configuration: config)
        webView.isOpaque = false
        webView.backgroundColor = Self.canvas
        webView.scrollView.backgroundColor = Self.canvas
        webView.scrollView.contentInsetAdjustmentBehavior = .never
        webView.scrollView.alwaysBounceVertical = true
        webView.allowsBackForwardNavigationGestures = true
        webView.navigationDelegate = context.coordinator
        if #available(iOS 16.4, *) {
            webView.isInspectable = true
        }
        webView.load(URLRequest(url: URL(string: "lens://localhost/index.html")!))
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}

    private static let canvas = UIColor(red: 11 / 255, green: 11 / 255, blue: 13 / 255, alpha: 1)

    final class Coordinator: NSObject, WKURLSchemeHandler, WKNavigationDelegate {
        func webView(_ webView: WKWebView, start urlSchemeTask: WKURLSchemeTask) {
            guard let url = urlSchemeTask.request.url else {
                urlSchemeTask.didFailWithError(URLError(.badURL))
                return
            }

            var relative = url.path
            if relative.isEmpty || relative == "/" {
                relative = "/index.html"
            }

            guard let www = Bundle.main.resourceURL?.appendingPathComponent("www", isDirectory: true) else {
                urlSchemeTask.didFailWithError(URLError(.fileDoesNotExist))
                return
            }

            let trimmed = relative.trimmingCharacters(in: CharacterSet(charactersIn: "/"))
            let file = www.appendingPathComponent(trimmed).standardizedFileURL
            let root = www.standardizedFileURL.path
            guard file.path.hasPrefix(root),
                  FileManager.default.fileExists(atPath: file.path),
                  let data = try? Data(contentsOf: file)
            else {
                urlSchemeTask.didFailWithError(URLError(.fileDoesNotExist))
                return
            }

            let mime = Self.mimeType(for: file.pathExtension)
            let response = URLResponse(
                url: url,
                mimeType: mime,
                expectedContentLength: data.count,
                textEncodingName: "utf-8"
            )
            urlSchemeTask.didReceive(response)
            urlSchemeTask.didReceive(data)
            urlSchemeTask.didFinish()
        }

        func webView(_ webView: WKWebView, stop urlSchemeTask: WKURLSchemeTask) {}

        func webView(
            _ webView: WKWebView,
            decidePolicyFor navigationAction: WKNavigationAction,
            decisionHandler: @escaping (WKNavigationActionPolicy) -> Void
        ) {
            guard let url = navigationAction.request.url else {
                decisionHandler(.allow)
                return
            }
            if url.scheme == "lens" {
                decisionHandler(.allow)
                return
            }
            if url.scheme == "http" || url.scheme == "https" {
                UIApplication.shared.open(url)
                decisionHandler(.cancel)
                return
            }
            decisionHandler(.allow)
        }

        private static func mimeType(for ext: String) -> String {
            if let type = UTType(filenameExtension: ext), let mime = type.preferredMIMEType {
                return mime
            }
            switch ext.lowercased() {
            case "html", "htm": return "text/html"
            case "js", "mjs": return "text/javascript"
            case "css": return "text/css"
            case "json": return "application/json"
            case "svg": return "image/svg+xml"
            case "png": return "image/png"
            case "webp": return "image/webp"
            case "woff2": return "font/woff2"
            default: return "application/octet-stream"
            }
        }
    }
}
