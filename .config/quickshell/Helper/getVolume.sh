#!/bin/bash

volumeCMD="$(wpctl get-volume @DEFAULT_AUDIO_SINK@)"

volume=($volumeCMD)

echo ${volume[1]}