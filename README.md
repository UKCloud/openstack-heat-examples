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
│   ├── scripts/
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
