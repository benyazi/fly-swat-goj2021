#!/bin/bash

git pull origin master
java -jar ../bob_1_2_188.jar --archive --platform js-web resolve distclean build bundle
