## Installation

Although Sublime installation is pretty easy, here we show you 2 different ways using a script written in bash by ours or downloading it from the official website. Feel free to choose whatever you prefer :)



### Use our custom shell-script

We have developed a great and simple script that is able to:

- Install Sublime Text from a repository to be always updated
- Install the Package Control (in order to use some Sublime Plugins)
- Add plugins from a selection written for you in a text file or from pre-defined lists
- Also, it lets you re-install or uninstall the editor in case of errors
- And it works 100% on Linux.

You just need to download it from [./install.sh][1] and launch it to make easier all the steps of the process.



### Download from the authors website

In case you prefer the traditional way, here are the steps you must follow:

 1. You may download the program from [the official Sublime website][2] as well.
 2. You also may download the Package Control, an extra tool to enhance Sublime Text with plugins and add-ons (our script will ask you if you wish to install it or not). If you wish to install it, you have two alternatives:

    a. Download it from [the official website][3] and move the file to *.config/sublime_text/installed packages/*

    b. Open the internal Sublime console using with **View > Show Console** or using the **Ctrl + `** shortcut. Then, copy and paste the following code:

    ```python
    import urllib2,os;
    pf='Package Control.sublime-package';
    ipp=sublime.installed_packages_path();
    os.makedirs(ipp) if not os.path.exists(ipp) else None;
    urllib2.install_opener(urllib2.build_opener(urllib2.ProxyHandler()));
    open(os.path.join(ipp,pf),'wb').write(urllib2.urlopen('http://sublime.wbond.net/'+pf.replace(' ','%20')).read());
    print('Please restart Sublime Text to finish installation')
    ```

 3. Once you have installed the Package Control, please restart Sublime to check out the changes and you will be ready to use thousands of great plugins!

[1]: ./install.sh
[2]: http://sublimetext.com/download
[3]: http://wbond.net/sublime_packages/package_control
