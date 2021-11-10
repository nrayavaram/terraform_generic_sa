### There are 3- sentinel files, having code to validate service accounts, internal ips and ssl enforcement. Below are the three policies, those need to be validated successfully to deploy the terraform code. 
* Only Custom Service Account will be used.
* Internal IPs will be enabled only, no communication thorugh external ip addresses.
* Only https access will be allowed.

## appsec_gcp_serviceaccount_restriction
#### Used Variables 
* selected_node: It is being used locally to have information of node by passing the path.
* messages: It is being used to hold the complete message of policies violation to show to the user.
* default_compute_sa: 

#### Used Maps
* resourceTypesServiceAccountMap: This is the map, being used to have path of node for the respective gcp service for Job  Trigger policy. Here Key is having complete path of particular node.

#### Used Methods
* check_service_account_config: This function is being used to validate the value of parameter "recurrence_period_duration". As per the policy, its value needs to be lied between 1 day to 60 days. It can not be empty/null and will be sufficed with 's'. If the policy won't be validated successfully, it will generate appropriate message to show the users. This function will have below 2-parameters:

    * Parameters
        * address => The key inside of resource_changes section for particular GCP Resource in tfplan mock
        * rc => The value of address key inside of resource_changes section for particular GCP Resource in tfplan mock

## network_gcp_ip_restriction
#### Used Variables 
* selected_node: It is being used locally to have information of node by passing the path.
* messages: It is being used to hold the complete message of policies violation to show to the user.

#### Used Maps
* resourceTypesInternalIPMap: This is the map, being used to have path of nodes for the respective gcp service for Save Finding policy. It is having two enteries with two keys "key" and "inspect_key". 
As per the policy, "inspect_job.0.actions.0.save_findings.0.output_config.0.table.0.dataset_id" needs to have appropriate value for the dataset_id.
As per terraform, inspect_job is not required section, so "inspect_job" & "dataset_id" both need to be validated for null/empty.

#### Used Methods
* check_internal_ip: This function is being used to validate the value of parameter "recurrence_period_duration". As per the policy, its value needs to be lied between 1 day to 60 days. It can not be empty/null and will be sufficed with 's'. If the policy won't be validated successfully, it will generate appropriate message to show the users. This function will have below 2-parameters:

    * Parameters
        * address => The key inside of resource_changes section for particular GCP Resource in tfplan mock
        * rc => The value of address key inside of resource_changes section for particular GCP Resource in tfplan mock

## network_gcp_ssl_enforce
#### Used Variables 
* selected_node: It is being used locally to have information of node by passing the path.
* messages: It is being used to hold the complete message of policies violation to show to the user.

#### Used Maps
* resourceTypesSSLEnforceMap: This is the map, being used to have path of nodes for the respective gcp service for Save Finding policy. It is having two enteries with two keys "key" and "inspect_key". 
As per the policy, "inspect_job.0.actions.0.save_findings.0.output_config.0.table.0.dataset_id" needs to have appropriate value for the dataset_id.
As per terraform, inspect_job is not required section, so "inspect_job" & "dataset_id" both need to be validated for null/empty.

#### Used Methods
* check_endpoint_config: This function is being used to validate the value of parameter "inspect_job.0.actions.0.save_findings.0.output_config.0.table.0.dataset_id". As per the policy, its value can not be null/empty and must be proper valid dataset_id. If the policy won't be validated successfully, it will generate appropriate message to show the users. This function will have below 2-parameters:

    * Parameters
        * address => The key inside of resource_changes section for particular GCP Resource in tfplan mock
        * rc => The value of address key inside of resource_changes section for particular GCP Resource in tfplan mock