#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'


function print_stage {
	printf "${YELLOW}${1}${NC}\n"
}

function print_info {
	printf "${BLUE}${1}${NC}\n"
}

function print_success {
	printf "${GREEN}${1}${NC}\n"
}

function print_error {
	printf "${RED}${1}${NC}\n"
}

export -f print_stage
export -f print_info
export -f print_success
export -f print_error
