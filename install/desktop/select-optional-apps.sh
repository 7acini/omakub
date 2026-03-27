#!/bin/bash

if [[ -v OMAKDEB_FIRST_RUN_OPTIONAL_APPS ]]; then
	apps=$OMAKDEB_FIRST_RUN_OPTIONAL_APPS

	if [[ -n "$apps" ]]; then
		for app in $apps; do
			source "$OMAKDEB_PATH/install/desktop/optional/app-${app,,}.sh"
		done
	fi
fi
