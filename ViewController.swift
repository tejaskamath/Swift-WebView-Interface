import UIKit
import WebKit
class ViewController: UIViewController, WKUIDelegate, WKScriptMessageHandler {

    let userContentController = WKUserContentController()

    override func loadView() {
        super.loadView()

        let config = WKWebViewConfiguration()
        config.userContentController = userContentController

        self.webView = WKWebView(frame: self.view.bounds, configuration: config)
        userContentController.add(self, name: "userLogin")

        self.view = self.webView

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let myURL = URL(string: "https://tejaskamath.github.io/Swift-WebView-Interface")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {

        let dict = message.body as! [String:AnyObject]
        let username    = dict["username"] as! String
        let secretToken = dict["secretToken"] as! String

        print(message.name)
        print(username)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
