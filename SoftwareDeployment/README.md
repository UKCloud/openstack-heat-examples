# Using OS::Heat::SoftwareDeployment Resources

This is an example HEAT Template that deploys a vanilla instance and
automatically installs and configures the pre-req os-collect-config 
tools on the instance in order to make use of OS::Heat::SoftwareConfig / 
OS::Heat::SoftwareDeployment and associated HEAT resources.

To deploy this example, customise the environment_example.yaml file with your
own SSH Keypair and the Network name to deploy onto and run:
```
> openstack stack create -t software_deployment.yaml -e environment_example.yaml --wait deploy-demo
2016-12-07 12:03:55 [deploy-demo]: CREATE_IN_PROGRESS  Stack CREATE started
2016-12-07 12:03:55 [deploy-demo.ssh_ext_secgroup]: CREATE_IN_PROGRESS  state changed
2016-12-07 12:03:56 [deploy-demo.software_config]: CREATE_IN_PROGRESS  state changed
2016-12-07 12:03:56 [deploy-demo.config_agent]: CREATE_IN_PROGRESS  state changed
2016-12-07 12:03:56 [deploy-demo.ssh_ext_secgroup]: CREATE_COMPLETE  state changed
2016-12-07 12:03:56 [deploy-demo.software_config]: CREATE_COMPLETE  state changed
2016-12-07 12:03:58 [deploy-demo.config_agent]: CREATE_COMPLETE  state changed
2016-12-07 12:03:59 [deploy-demo.server]: CREATE_IN_PROGRESS  state changed
2016-12-07 12:04:09 [deploy-demo.server]: CREATE_COMPLETE  state changed
2016-12-07 12:04:09 [deploy-demo.deploy_config]: CREATE_IN_PROGRESS  state changed
2016-12-07 12:07:35 [deploy-demo.deploy_config]: SIGNAL_IN_PROGRESS  Signal: deployment succeeded
2016-12-07 12:07:35 [deploy-demo.deploy_config]: CREATE_COMPLETE  state changed
2016-12-07 12:07:35 [deploy-demo]: CREATE_COMPLETE  Stack CREATE completed successfully
+---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field               | Value

                                                                                 |
+---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| id                  | 9108ca32-0e0e-4852-ba5a-7151a29d9f66

                                                                                 |
| stack_name          | deploy-demo

                                                                                 |
| description         | This HEAT template demonstrates the creation of an instances and uses the OS::Heat::SoftwareConfig and OS::Heat::SoftwareDeployment resources to deploy software using os-collect-config tools. The template takes a vanilla OS deployment and automatically installs and configures os-collect-config in preparation for connecting to the HEAT engine. |
|                     |

                                                                                 |
| creation_time       | 2016-12-07T12:03:55

                                                                                 |
| updated_time        | None

                                                                                 |
| stack_status        | CREATE_COMPLETE

                                                                                 |
| stack_status_reason | Stack CREATE completed successfully

                                                                                 |
+---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
```

