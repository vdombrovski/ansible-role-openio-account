[![Build Status](https://travis-ci.org/open-io/ansible-role-openio-account.svg?branch=master)](https://travis-ci.org/open-io/ansible-role-openio-account)
# Ansible role `account`

An Ansible role for install and configure a servicetype account.


## Requirements

- Ansible 2.4+

## Role Variables


| Variable   | Default | Comments (type)  |
| :---       | :---    | :---             |
| `openio_account_bind_address` | `"{{ hostvars[inventory_hostname]['ansible_' + openio_account_bind_interface]['ipv4']['address'] }}"` | Address  |
| `openio_account_bind_interface` | `"{{ ansible_default_ipv4.alias }}"` | Network Interface  |
| `openio_account_bind_port` | `6009` | TCP port to use |
| `openio_account_gridinit_file_prefix` | `` | Maybe set it to {{ openio_account_namespace }}- for old gridinit's style |
| `openio_account_gridinit_dir` | `/etc/gridinit.d/{{ openio_account_namespace }}` | Path to copy the gridinit conf |
| `openio_account_location` | `"{{ ansible_hostname }}"` | Minimal distance to distributed a content/meta/rdir |
| `openio_account_log_address` | `/dev/log` | log file |
| `openio_account_log_facility` | `LOG_LOCAL0` | Facility syslog |
| `openio_account_log_level` | `INFO` | Log Verbosity |
| `openio_account_namespace` | `"OPENIO"  | Namespace |
| `openio_account_redis_standalone` | ``| IP:PORT of a standalone redis (not compatible with `openio_account_sentinel_master_name`)|
| `openio_account_sentinel_master_name` | `"{{ openio_account_namespace }}-master-1"` | Sentinel master name (not compatible with `openio_account_redis_standalone`) |
| `openio_account_sentinels_hosts` | `` | List of sentinels <IP:PORT> |
| `openio_account_serviceid` | `"0"` | ID in gridinit |
| `openio_account_slots` | `[account]` | The service's slot in conscience |
| `openio_account_version` | `latest` | Install a specific version |
| `openio_account_workers` | `` | Number of worker (default if empty) |
| `openio_account_provision_only` | `false` | Provision only without restarting services |
| `openio_account_package_upgrade` | `false` | Set the packages to the latest version (to be set in extra_vars) |

## Dependencies

No dependencies.

## Example Playbook

```yaml
- hosts: all
  become: true
  vars:
    NS: OPENIO
  roles:
    - role: repo
    - role: gridinit
      openio_gridinit_namespace: "{{ NS }}"
    - role: account
      openio_account_namespace: "{{ NS }}"
      openio_account_bind_address: "172.17.0.2"
      openio_account_sentinels_hosts: "172.17.0.2:6012,172.17.0.3:6012,172.17.0.4:6012"
```


```ini
[all]
node1 ansible_host=192.168.1.173
```

## Contributing

Issues, feature requests, ideas are appreciated and can be posted in the Issues section.

Pull requests are also very welcome.
The best way to submit a PR is by first creating a fork of this Github project, then creating a topic branch for the suggested change and pushing that branch to your own fork.
Github can then easily create a PR based on that branch.

## License

GNU AFFERO GENERAL PUBLIC LICENSE, Version 3

## Contributors

- [Cedric DELGEHIER](https://github.com/cdelgehier) (maintainer)
