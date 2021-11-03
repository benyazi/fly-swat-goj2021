#!/bin/bash

git pull origin master
java -jar ../bob.jar --archive --platform js-web resolve distclean build bundle
