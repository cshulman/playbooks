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


### Specific OCP 4 Version: <br>
You can also choose to install a very *specific OCP 4 version* by utilizing the playbooks in the **`playbooks/version-specific/`** directory.

- To specify an install of a specific version (ex. 4.3.13): <br>
	**`sudo ansible-playbook playbooks/version-specific/version-specific-setup.yaml -e ocp_version=4.3.13`**

*Note: Since an OCP 4 version is specified, it will be critical for that version to exist to avoid failure on install. These methods are useful when a particular OCP 4 version is targetted for installtion.*
