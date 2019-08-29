Modification of https://gist.github.com/huddlesj/5a2356b9f8f34eb5a131a4574f9345c4

Changes Made:
- Parameterized ocp version
- Fixed typo

NOTE :: All playbooks assume Linux host


Files include:
 - ocp41-latest-setup.yaml
	This will install the latest 4.1 oc client and installer

 - ocp4-version-specific-setup.yaml
	This will install the version of the installer and client specified in the ocp_version variable

 - ocp4-env-setup.yaml 
	Currently this is ocp4-version-specific-setup.yaml playbook + installs Terraform v0.11.12
