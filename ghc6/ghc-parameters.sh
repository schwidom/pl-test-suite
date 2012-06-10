#!/bin/bash

echo TestEnv.hs $( for i in $(cat modules.lst); do echo -n "$i.hs "; done) Main.hs

