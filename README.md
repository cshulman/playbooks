Modification of https://gist.github.com/huddlesj/5a2356b9f8f34eb5a131a4574f9345c4

# Playbook Information:
***Note that the current version of this repository ony includes an AWS setup & will install the AWS CLI. If you do not need or want it, comment those lines from the playbook you are using***


## GA Versions:
- Currently there are 2 versions that are GA'd & 4.2 is the latest release. 

	- To run the playbook as is and install the client & installer for 4.2:<br>
		`sudo ansible-playbook playbooks/aws/ocp4-latest.yaml`

	- To specify an install of the latest of a specific version (currently only supported for 4.1):<br>
	 	`sudo ansible-playbook playbooks/aws/ocp4-latest.yaml -e ocp_version=4.1`

	- To specify an install of a specific version (ex. 4.2.1):<br>
		`sudo ansible-playbook playbooks/aws/version-specific/version-specific-setup.yaml -e ocp_version=4.2.1`
	- Lastly, if you prefer to to hard code the version in the playbook, you can choose to update the src for the client & installer and run:<br>
		`sudo ansible-playbook playbooks/aws/version-specific/hard-coded-version-setup.yaml`


## Dev Preview Version:<br>
- The current Dev Preview version is 4.3.

	- To install the latest Dev Preview release (currently a 4.3 nightly):<br>
		`sudo ansible-playbook playbooks/aws/DPlatest.yaml`
		
	- To install a specific nightly build, update the src for the client & installer and run:<br>
                `sudo ansible-playbook playbooks/aws/version-specific/hard-coded-version-setup.yaml`
