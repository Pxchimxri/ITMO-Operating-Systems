#!/bin/bash

> cfg
awk '$1 == "MemTotal:" {print "MemTotal: " $2 " " $3 }' /proc/meminfo >> cfg
awk '$1 == "SwapTotal:" {print "SwapTotal: " $2 " " $3 }' /proc/meminfo >> cfg
awk '$1 == "MemFree:" {print "MemFree: " $2 " " $3}' /proc/meminfo >> cfg
awk '$1 == "SwapFree:" {print "SwapFree: " $2 " " $3}' /proc/meminfo >> cfg
