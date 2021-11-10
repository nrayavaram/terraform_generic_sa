### There are 3- sentinel files, having code to validate service accounts, internal ips and ssl enforcement. Below are the three policies, those need to be validated successfully to deploy the terraform code. 
* Only Custom Service Account will be used.
* Internal IPs will be enabled only, no communication thorugh external ip addresses.
* Only https access will be allowed.

## appsec_gcp_serviceaccount_restriction
#### Used Variables 
* selected_node: It is being used locally to have information of node by passing the path.
* messages: It is being used to hold the complete message of policies violation to show to the user.
* default_compute_sa: This is having email id of default compute service account to validate.

#### Used Maps
* resourceTypesServiceAccountMap: This is the map, being used to have path of node for the respective gcp service for Service Account policy. Here Key is having complete path of particular node.

#### Used Methods
* check_service_account_config: This function is being used to validate the value of parameter "service_account". As per the policy, SA can not be empty/null otherwise it will take default compute service account later on. There must be either reference of service account resource or any email. If the policy won't be validated successfully, it will generate appropriate message to show the users. This function will have below 2-parameters:

    * Parameters
        * address => The key inside of resource_changes section for particular GCP Resource in tfplan mock
        * rc => The value of address key inside of resource_changes section for particular GCP Resource in tfplan mock

## network_gcp_ip_restriction
#### Used Variables 
* selected_node: It is being used locally to have information of node by passing the path.
* messages: It is being used to hold the complete message of policies violation to show to the user.

#### Used Maps
* resourceTypesInternalIPMap: This is the map, being used to have path of nodes for the respective gcp service for Internal IP policy. 

#### Used Methods
* check_internal_ip: This function is being used to validate the value of parameter "internal_ip_only". As per the policy, its value needs to be true and it can not be empty/null. If the policy won't be validated successfully, it will generate appropriate message to show the users. This function will have below 2-parameters:

    * Parameters
        * address => The key inside of resource_changes section for particular GCP Resource in tfplan mock
        * rc => The value of address key inside of resource_changes section for particular GCP Resource in tfplan mock

## network_gcp_ssl_enforce
#### Used Variables 
* selected_node: It is being used locally to have information of node by passing the path.
* messages: It is being used to hold the complete message of policies violation to show to the user.

#### Used Maps
* resourceTypesSSLEnforceMap: This is the map, being used to have path of nodes for the respective gcp service for SSL Enforcement policy.

#### Used Methods
* check_endpoint_config: This function is being used to validate the value of parameter "enable_http_port_access". As per the policy, its value can not be true. If the policy will not be validated successfully, it will generate appropriate message to show the users. This function will have below 2-parameters:

    * Parameters
        * address => The key inside of resource_changes section for particular GCP Resource in tfplan mock
        * rc => The value of address key inside of resource_changes section for particular GCP Resource in tfplan mock