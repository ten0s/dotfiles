#!/bin/bash

exec google-chrome "$@" --proxy-pac-url='data:application/x-javascript-config;base64,'$(base64 -w0 ~/.proxy.pac)
