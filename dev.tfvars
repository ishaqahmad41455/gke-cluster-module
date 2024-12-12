# For VPC
compute_service_enabled     = true
container_service_enabled   = true
vpc_name                   = "dev-vpc"
routing_mode               = "REGIONAL"
auto_create_subnetworks     = false
mtu                         = 1460
delete_default_routes_on_create = false

# For SUBNETS
subnet_name               = "dev-subnet"
subnet_ip_range           = "10.0.0.0/16"
region                    = "us-central1"
private_ip_google_access  = true
pod_range_name            = "dev-k8s-pod-range"
pod_ip_cidr_range         = "10.1.0.0/16"
service_range_name        = "dev-k8s-service-range"
service_ip_cidr_range     = "10.2.0.0/20"
ip_cidr_range             = "10.0.0.0/16"
# network_self_link         = "projects/my-project/global/networks/my-network"

project_id                = "aesthetic-site-443805-a0"

# For NAT
nat_name                       = "dev-nat"
source_subnetwork_ip_ranges_to_nat = ["ALL_IP_RANGES"]
source_ip_ranges_to_nat        = ["ALL_IP_RANGES"]

# ROUTE
router_name = "my-router"
network     = "vpc-network-id-from-vpc-module"

account_id   = "kubernetes-sa"
display_name = "Kubernetes Service Account"

general_node_pool_name = "general-node-pool"
spot_node_pool_name    = "spot-node-pool"

# CLUSTER
cluster_name  = "my-cluster"
general_node_count = 1
spot_min_node_count = 0
spot_max_node_count = 5
general_machine_type = "n1-standard-1"
spot_machine_type    = "n1-standard-1"


location                       = "us-central1-a"
node_locations                 = ["us-central1-b"]
# network                        = "<your-vpc-network-self-link>"
subnetwork                     = "<your-subnetwork-self-link>"
logging_service                = "logging.googleapis.com/kubernetes"
networking_mode                = "VPC_NATIVE"
workload_pool                  = "aesthetic-site-443805-a0.svc.id.goog"
cluster_secondary_range_name   = "k8s-pod-range"
services_secondary_range_name  = "k8s-service-range"
enable_private_nodes           = true
enable_private_endpoint        = false
master_ipv4_cidr_block         = "172.16.0.0/28"
release_channel                = "REGULAR"
deletion_protection            = false


firewall_name   = "allow-ssh"
# network         = "<your-vpc-network-name>"
allowed_protocol = "tcp"
allowed_ports    = ["22"]
source_ranges    = ["0.0.0.0/0"]
