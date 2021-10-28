module "tfplan-functions" {
    source = "../common-functions/tfplan-functions/tfplan-functions.sentinel"
}

module "tfstate-functions" {
    source = "../common-functions/tfstate-functions/tfstate-functions.sentinel"
}

module "tfconfig-functions" {
    source = "../common-functions/tfconfig-functions/tfconfig-functions.sentinel"
}

module "generic-functions" {
    source = "../common-functions/generic-functions/generic-functions.sentinel"
}

mock "tfplan/v2" {
  module {
    source = "./mocks/mock-tfplan-v2.sentinel"
  }
}

policy "appsec_gcp_serviceaccount_restriction" {
    source = "./appsec_gcp_serviceaccount_restriction.sentinel"
    enforcement_level = "advisory"
}


