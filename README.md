# openstack-heat-examples
Automation examples for Openstack using the HEAT templating language

## What is HEAT?
HEAT is Openstack's template-driven orchestration engine. It allows
users to define servers, networks, storage etc as "YAML"
(https://en.wikipedia.org/wiki/YAML)  templates which
can then be deployed as "Stacks" to create complex systems which are
scalable, repeatable and automatable.
See: https://wiki.openstack.org/wiki/Heat for more info on what HEAT is.

## This Repository
This repository exists primarily to help UKCloud customers use Openstack
effectively. As such the examples have been deployed and tested on
UKCloud's "Cloud Native Infrastructure" but should work on other
Openstack platforms too.

## Repository Structure
Each example is contained in a directory (e.g SomeExample/) within this
repository with a common structure:

```
├── SomeExample/
│   ├── README.md
│   ├── some_example.yaml
│   ├── environment_example.yaml
│   │
│   ├── files/
│   │   ├── some_script.sh
│   │
│   ├── resources/
│   │   ├── some_server.yaml
│
```

* README.md
 * Any useful info about how to run this specific example
* some_example.yaml
 * The main template file to be run with the `openstack stack create`
   command
* environment_example.yaml
 * A sample environment.yaml file to be customised with parameters such
   as network names etc
* scripts/ (optional)
 * A directory containing any scripts required to instantiate the
   template
* resources/ (optional)
 * A directory containing any resource definitions which are defined
   outside the main template file (e.g webserver_master.yaml)


## Running An Example
To run an example first copy the environment_example.yaml file to
environment.yaml and edit it to include your own settings:

```
cp environment_example.yaml environment.yaml
vim environment.yaml
```

Then create the example using:

```
openstack stack create -f yaml -t some_example.yaml -e environment.yaml my_example
```
(where 'my_example' is a friendly name for the stack you want to create)

Stack creation can take some time. To view progress run:
```
openstack stack show my_example
```
The stack is created once "stack_status" shows "CREATE_COMPLETE"


If the example template supports being run multiple times then you can
execute the following:

**WARNING!! Some update operations will delete & recreate resources in the stack. Use with caution**
```
openstack stack update -f yaml -t some_example.yaml -e environment.yaml
```

## Contribution Guidelines
UKCloud welcomes contribtuions to this repository both in terms of new
examples and corrections or enhancements to existing ones. 

If you spot a problem, first please raise an Issue in Github. We will
attempt to fix the issue for you as soon as we are able.
If you would like to submit your own patch for the issue then please go ahead
and fork our repository then submit a Pull Request when you are happy
with your work.

### Contribution best practice

* Follow the directory structure listed above
* Treat readability of template files as a priority
* Break resources out into child templates in the "resources/" directory
  where appropriate
* Do not use inline scripts. Always store scripts in the "files/"
  directory and reference using the { get_file: } function

## Examples

### Ansible HEAT hooks

To create a virtual machine via HEAT which programmatically configures the HEAT ansible hook the following example code can be used.

**Step 1 - setup HEAT resources**

The process relies on additional HEAT resources to handle the installation of ansible and the HEAT ansible hook. You'll need to following files available to HEAT when you run your deployment:

```
collect-config-setup/install_config_agent_centos_yum.yaml
files/install_config_agent_yum.sh
files/configure_config_agent.sh
files/start_config_agent.sh
```

**Step 2 - setup your HEAT code to instantiaite the new resources**

Within your HEAT when you instantiate the server you'll need to create a new resource.

```
  config_agent:
    type: collect-config-setup/install_config_agent_centos_yum.yaml
```

When you create your server you'll need to reference the new resource as user_data, e.g.

```
  example_server:
    type: OS::Nova::Server
    properties:
      name: example_server
      flavor: { get_param: flavor }
      image: { get_param: image }
      key_name: { get_param: key_name }
      networks:
        - port: { get_resource: example_server_port0 }
      security_groups:
        - { get_resource: ssh_ext_secgroup }
      user_data_format: SOFTWARE_CONFIG
      user_data: { get_attr: [config_agent, config] }
```

**Step 3 - add HEAT software deployment code to call the ansible hook inside the VM**

You can then define a group of ansible which will instruct HEAT to run your code on the VM using Ansible, e.g.

Create a new software deployment block referencing your ansible code.

```
  ansible_config:
    type: OS::Heat::SoftwareConfig
    properties:
      group: ansible
      config:
        str_replace:
          template: { get_file: 'files/clone_git_repo_with_ansible.yaml' }
          params:
            _gitUrl_: { get_param: gitUrl }
      outputs:
      - name: result
```

Create a config block to specify specific parameters for the server you are targeting and link it to your VM.

```
  deploy_ansible_config:
    type: OS::Heat::SoftwareDeployment
    properties:
      signal_transport: CFN_SIGNAL
      config:
        get_resource: ansible_config
      server:
        get_resource: example_server
```

## License
Copyright 2016 UKCloud

Licensed under the Apache License, Version 2.0 (the "License"); you may
not use this file except in compliance with the License. You may obtain
a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
