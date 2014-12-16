# gfl_web

Flask app to create a web-based interface for GFL-FUDG annotation.

By Michael Mordowanec, Nathan Schneider, etc.

## Docker

On Linux, you're in luck. Docker is an easy package to install for Ubuntu / Debian / Arch / CentOS.

On Mac OS X, boot2docker makes things pretty easy. [Install](https://github.com/boot2docker/osx-installer/releases) it, then run through the [setup steps](https://docs.docker.com/installation/mac/). This involves something like:

    boot2docker init
    boot2docker up

And then you'll need to have some `DOCKER_` environment variables available, so you can either run `$(boot2docker shellinit)` whenever you want to use docker, or stick those variables into your `~/.bashrc`.

You'll know boot2docker is installed successfully when you can run `docker run --rm -it debian:jessie bash` and it drops you into a bash shell that looks like `root@3127e9e28b7d:/#`.

## Fig bootstrap

Install fig: `easy_install fig`

Then, in this directory, run `fig up`. It should produce some output that looks like this:

    Creating gflweb_web_1...
    Attaching to gflweb_web_1
    web_1 |  * Running on http://0.0.0.0:5000/
    web_1 |  * Restarting with reloader

Now, open up the app in your browser: [http://192.168.59.103:5000/](http://192.168.59.103:5000/)


## Without Fig

In this directory:

    docker build --tag gfl_web:latest .
    docker run -p 5000:5000 gfl_web:latest


---

Input Files
===========

After running the utility, .preproc files can be added to the preproc directory in the gfl_web directory (or the place specified in config.py). .preproc is the format used by the gfl_syntax tools whose repository (included as a submodule) has scripts to help create it. Files added here will automatically be converted to JSON and appear as a list of batches on the admin screen.

The .preproc format should look something like this for the sentence 'Mike said, "Ideally, I would have liked to use a much, much better example sentence."':

    ---
    % ID uniqueID
    % RAW TEXT
    Mike said, "Ideally, I would have liked to use a much, much better example sentence."

    % TEXT
    Mike said , " Ideally , I would have liked to use a much~1 , much~2 better example sentence . "

    % ANNO
    Mike said Ideally I would have liked to use a much~1 much~2 better example sentence

.preproc files can contain many such sentences, and if placed into the preproc directory they will be sectioned off into batches which can be assigned to annotators in the admin interface. The number of annotations per batch as well as the amount of overlap (for measuring inter-annotator agreement) can be set in config.py.

Usage
=====
The annotation interface is designed to be as self-explanatory as possible. Logging in and out is left to be set up according to the needs of the user. Currently all that one need do is go to 'http://<domain or IP>/login?user=' followed by their username and the program will log them in.

The admin interface is restricted to only those usernames listed in config.py. If you are not planning to use a safer login method, it is recommended that these names be kept secret and hard to guess.

The annotation interface uses the Ace texteditor, so special thanks to them (http://ace.c9.io/).


Other
=====
Feel free to fork this project and help develop it.

GFL-FUDG guidelines:
https://github.com/brendano/gfl_syntax/blob/master/guidelines/guidelines.md

Direct any questions about the web interface to Michael Mordowanec:
https://github.com/Mordeaux

Noah's ARK at the Language Technologies Institute at Carnegie Mellon University:
http://www.ark.cs.cmu.edu/
