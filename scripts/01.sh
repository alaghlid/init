#!/bin/bash
eval cat /etc/passwd | cut -d ":" -f1,3,7
