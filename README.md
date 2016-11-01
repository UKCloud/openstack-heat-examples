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



## Running An Example

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
