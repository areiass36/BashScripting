#!/bin/sh

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


