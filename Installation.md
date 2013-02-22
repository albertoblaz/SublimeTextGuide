## Installation

Although Sublime installation is pretty easy, here we show you 2 different ways using a script written in bash by ours or downloading it from the official website. Feel free to choose whatever you prefer :)


### Use our custom shell-script

We have developed a script that works 100% on Linux. It adds Sublime in the list of repos, download and install the program with its Package Control plugin, which lets you add new plugins in the future


### Download from the authors website

In case you prefer the traditional way, here are the steps you must follow:

   1. You may download the program from [the official Sublime website](http://sublimetext.com/download) as well.
   2. Now, open the editor and do *Ctrl+`* to show the internal console
   3. Then, copy and paste the next code into the console:

  ```python
  import urllib2,os;
  pf='Package Control.sublime-package';
  ipp=sublime.installed_packages_path();
  os.makedirs(ipp) if not os.path.exists(ipp) else None;
  urllib2.install_opener(urllib2.build_opener(urllib2.ProxyHandler()));
  open(os.path.join(ipp,pf),'wb').write(urllib2.urlopen('http://sublime.wbond.net/'+pf.replace(' ','%20')).read());
  print('Please restart Sublime Text to finish installation')
  ```

   4. Restart Sublime to check out the changes
