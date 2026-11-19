import AppKit

enum CatalogueUpdates {
    static func open() {
        guard let url = NSWorkspace.shared.urlForApplication(withBundleIdentifier: "com.makeitfuture.Apps") else {
            let alert = NSAlert()
            alert.messageText = "Updates are managed by Makeitfuture Apps"
            alert.informativeText = "Install or open the Makeitfuture Apps catalogue to update this app."
            alert.runModal()
            return
        }
        NSWorkspace.shared.openApplication(at: url, configuration: .init())
    }
}
