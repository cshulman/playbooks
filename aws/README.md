
##GA Versions:##
- Currently there are 2 versions that are GA'd. 

	- To run the playbook as is and install the client & installer for 4.2 - the most recent release:
		sudo ansible-playbook playbooks/aws/ocp4-latest.yaml

	- To specify an install of the latest of a specific version (currently only supported for 4.1):
	 	sudo ansible-playbook playbooks/aws/ocp4-latest.yaml -e ocp_version=4.1

	- To specify an install of a specific version (ex. 4.2.1):
		sudo ansible-playbook playbooks/aws/version-specific/version-specific-setup.yaml -e ocp_version=4.2.1
	- Lastly, if you prefer to to hard code the version in the playbook, you can choose to update the src for the client & installer and run:
		sudo ansible-playbook playbooks/aws/version-specific/hard-coded-version-setup.yaml


##Dev Preview Versions:##
	- To install the latest Dev Preview release (currently a 4.3 nightly):
		sudo ansible-playbook playbooks/aws/DPlatest.yaml

	- To install a specific nightly build, update the src for the client & installer and run:
                sudo ansible-playbook playbooks/aws/version-specific/hard-coded-version-setup.yaml
