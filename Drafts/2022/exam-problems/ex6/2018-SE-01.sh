#!/bin/bash

# mask 0022
# dir = 777 - 022 = 755
# file = 666 - 022 = 644

find . -type d | xargs -I {} chmod 755 {}
