Modification of https://gist.github.com/huddlesj/5a2356b9f8f34eb5a131a4574f9345c4

# Playbook Information:
***Note that by default all playbooks will install the AWS CLI. If you do not need or want to install it, run the playbooks with the following flag to skip those tasks:***
<br> **`--skip-tags "aws"`** <br>


## OCP 4 GA Release:

### Latest OCP 4 Versions: <br>

##### Latest GA Version:
To install the latest GA version of OCP 4.x, run the `ocp4-latest.yaml` playbook. The version OCP client and installer version it will install will vary based on what has been released and can be [found here](https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/). <br>

- To install the latest OCP version with the AWS CLI: <br>
         **`sudo ansible-playbook playbooks/ocp4-latest.yaml`**

- To install the latest OCP version **without** the AWS CLI: <br>
         **`sudo ansible-playbook playbooks/ocp4-latest.yaml --skip-tags "aws"`**


##### Latest of *Specific* GA Version:
You can also choose to install the latest GA version from a *specific OCP 4.x release*. To do so utilize the `version-latest.yaml` playbook, and specify the OCP 4.x version you are interested in. (This playbook currently defaults to 4.3, the latest GA release of OCP 4)

- To install the latest OCP 4.2 (other GA versions can be specified): <br>
	**`sudo ansible-playbook playbooks/version-latest.yaml -e ocp_version=4.2`**


### Specific OCP 4 Versions: <br>
You can also choose to install a very *specific OCP 4 version* by utilizing the playbooks in the **`playbooks/version-specific/`** directory.

- To specify an install of a specific version (ex. 4.3.13): <br>
	**`sudo ansible-playbook playbooks/version-specific/specific-version.yaml -e ocp_version=4.3.13`**

*Note: Since an OCP 4 version is specified, it will be critical for that version to exist to avoid failure on install. These methods are useful when a particular OCP 4 version is targeted for installation.*

You can also choose the specific version to install using the full link from the [OCP 4 repository](https://mirror.openshift.com/pub/openshift-v4/clients/ocp/). This can be done with the `playbooks/version-specific/link-specified.yaml` playbook and can be done one of 2 ways. <br>

1. Pass Parameters: <br>
	- After the client and installer version and links are identified, those values are passed as parameters to the `link-specified.yaml` playbook.

        **`sudo ansible-playbook playbooks/version-specific/link-specified.yaml -e client_link=https://mirror.openshift.com/pub/openshift-v4/clients/ocp/4.3.13/openshift-client-linux-4.3.13.tar.gz -e install_link=https://mirror.openshift.com/pub/openshift-v4/clients/ocp/4.3.13/openshift-install-linux-4.3.13.tar.gz`**

2. Modify Playbook: <br>
	- This will require modifying the `link-specified.yaml` playbook directly and replacing the default values set the client `client_link` and installer `install_link` variables. Then the playbook is run as is.

        **`sudo ansible-playbook playbooks/version-specific/link-specified.yaml`**


## Dev Preview Version:<br>
If you're looking to install a version that has not yet been released, you can follow the instructions for using the `playbooks/version-specific/link-specified.yaml` playbook and specify with links found from [ocp-dev-preview](https://mirror.openshift.com/pub/openshift-v4/clients/ocp-dev-preview/).

Alternatively, you can utilize the `DPlatest.yaml` playbook to install the latest developer preview version of OCP 4.x. <br>
  **`sudo ansible-playbook playbooks/DPlatest.yaml`**
