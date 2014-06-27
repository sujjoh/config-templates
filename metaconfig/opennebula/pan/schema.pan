declaration template metaconfig/opennebula/schema;

type uuid = string with match(SELF,'[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}');

type ip_ipv4 = string with match(SELF,'^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})');

type opennebula_datastore = {
    "name" : string 
};

type opennebula_datastore_ceph = {
    include opennebula_datastore
    "bridge_list" : string[]
    "ceph_host" : string[]
    "ceph_secret" : uuid 
    "ceph_user" : string
    "datastore_capacity_check" : boolean = true
    "disk_type" : string = 'RBD'
    "ds_mad" : string = 'ceph'
    "pool_name" : string
    "tm_mad" : string = 'ceph'
    "type" : string = 'IMAGE_DS'
};



type vnet = {
    "name" : string = 'node.cubone.os'
    "type" : string  = 'FIXED'
    "bridge" : string =  'br100'
    "gateway" : ip_ipv4 = '10.141.10.250' 
    "dns" : string = '10.141.10.250' with match(SELF,'^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})')
    "network" : string = '255.255.0.0' with match(SELF,'^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})')
};


type remoteconf_ceph = {
    "pool_name" : string = 'one'
    "host" : string = 'hyp004.cubone.os'
    "ceph_user" : string = 'libvirt'
    "staging_dir" : string = '/var/tmp' with match(SELF,'[^/]+/?$')
    "rbd_format" ? long(2)
};
