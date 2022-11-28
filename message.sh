#!/bin/sh

#This script is a alias for using ntfy cli
#so I don't have to remember the command how to use it
topicBaseName="barretoareias"
title="$1"
topic="$topicBaseName-$title"

message=" $2"

at="$3"

if [ -z "$at" ]; then 
    ntfy publish -t $title $topic $message; 
else 
    ntfy publish -t $title --at $at $topic $message; 
fi


