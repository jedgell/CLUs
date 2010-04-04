#!/bin/bash

find $1 -type $2 | xargs grep $3
