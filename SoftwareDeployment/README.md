# Using OS::Heat::SoftwareDeployment Resources

This is an example HEAT Template that deploys a vanilla instance and
automatically installs and configures the pre-req os-collect-config 
tools on the instance in order to make use of OS::Heat::SoftwareConfig / 
OS::Heat::SoftwareDeployment and associated HEAT resources.

To deploy this example, customise the environment_example.yaml file with your
own SSH Keypair and the Network name to deploy onto and run:
```
> openstack stack update -t software_deployment.yaml -e environment_rob.yaml --wait deploy-demo -f yaml
2016-12-07 12:41:58 [deploy-demo]: UPDATE_IN_PROGRESS  Stack UPDATE started
2016-12-07 12:42:00 [deploy-demo.config]: UPDATE_IN_PROGRESS  state changed
2016-12-07 12:42:01 [deploy-demo.config]: CREATE_IN_PROGRESS  state changed
2016-12-07 12:42:01 [deploy-demo.config_agent]: UPDATE_IN_PROGRESS  state changed
2016-12-07 12:42:02 [deploy-demo.config]: CREATE_COMPLETE  state changed
2016-12-07 12:42:05 [deploy-demo.config_agent]: UPDATE_COMPLETE  state changed
2016-12-07 12:42:05 [deploy-demo.deployment]: UPDATE_IN_PROGRESS  state changed
2016-12-07 12:42:08 [deploy-demo.deployment]: SIGNAL_IN_PROGRESS  Signal: deployment succeeded
2016-12-07 12:42:08 [deploy-demo.deployment]: UPDATE_COMPLETE  state changed
2016-12-07 12:42:11 [deploy-demo]: UPDATE_COMPLETE  Stack UPDATE completed successfully
id: 7bb3b89f-1e71-47c0-960a-e6c2a8ee0926
stack_name: deploy-demo
description: 'This HEAT template demonstrates the creation of an instances and uses
  the OS::Heat::SoftwareConfig and OS::Heat::SoftwareDeployment resources to deploy
  software using os-collect-config tools. The template takes a vanilla OS deployment
  and automatically installs and configures os-collect-config in preparation for connecting
  to the HEAT engine.

  '
creation_time: '2016-12-07T12:36:12'
updated_time: '2016-12-07T12:41:58'
stack_status: UPDATE_COMPLETE
stack_status_reason: Stack UPDATE completed successfully
```

