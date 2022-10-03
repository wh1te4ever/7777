# MacOS_remote
MacOS Remote Desktop for Xcode &amp; for testing purpose.

[![Screenshot-15.png](https://i.postimg.cc/QNJvnPxC/Screenshot-15.png)](https://postimg.cc/HjjSr6M1)



## System Info

    OS: macOS Monterey (version 12)
    RAM: 14GB DRAM
    Disk: 77GB available of 408GB
    Processer: 3.3GHz
    Screen: 20.5-inch (1176 * 885)
    Internet Speed: 1Gbps or higher
    Preinstall: Python 2, NodeJS 14, PHP 8, R, Xcode, Visual Studio, Chrome, Firefox, Microsoft Edge...

## How to use

    Click Fork in the right corner of the screen to save it to your Github.
    Visit https://dashboard.ngrok.com to get NGROK_AUTH_TOKEN
    In Github go to ⚙ Settings> Secrets> New repository secret
    In Name: enter NGROK_AUTH_TOKEN
    In Value: visit https://dashboard.ngrok.com/auth/your-authtoken Copy and Paste Your Authtoken into
    Press Add secret
    Go to Action> macOS> Run workflow
    Reload the page and press build > build
    Connect with VNC Viewer
        Install VNC Viewer
        Go to: https://dashboard.ngrok.com/endpoints/status copy host(eg: 0.tcp.in.ngrok.io:13472)
        Username: akhil
        Password: [Secrets]

* Use Team-Viewer for better lag free experience.
