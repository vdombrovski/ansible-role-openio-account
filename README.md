[![Build Status](https://travis-ci.org/open-io/ansible-role-openio-account.svg?branch=master)](https://travis-ci.org/open-io/ansible-role-openio-account)
# Ansible role `account`

An Ansible role for PURPOSE. Specifically, the responsibilities of this role are to:

-

## Requirements

- Ansible 2.4+

## Role Variables


| Variable   | Default | Comments (type)  |
| :---       | :---    | :---             |
| `openio_account_bind_address` | `"{{ ansible_default_ipv4.address }}"` | Address  |
| `openio_account_bind_port` | `6009` | TCP port to use |
| `openio_account_log_address` | `/dev/log` | log file |
| `openio_account_log_facility` | `LOG_LOCAL0` | Facility syslog |
| `openio_account_log_level` | `INFO` | Log Verbosity |
| `openio_account_namespace` | `"OPENIO"  | Namespace |
| `openio_account_sentinel_master_name` | `"{{ openio_account_namespace }}-master-0"` | Sentinel master name |
| `openio_account_sentinels_hosts` | `` | List of sentinels <IP:PORT> |
| `openio_account_serviceid` | `"0"` | ID in gridinit |
## Dependencies

No dependencies.

## Example Playbook

```yaml
- hosts: all
  gather_facts: true
  become: true
  roles:
    - role: account
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

Apache License, Version 2.0

## Contributors

- [Cedric DELGEHIER](https://github.com/cdelgehier) (maintainer)
- [Romain ACCIARI](https://github.com/racciari) (maintainer)
- [Vincent LEGOLL](https://github.com/vincent-legoll) (maintainer)
- [Sebastien LAPIERRE](https://github.com/sebastienlapierre) (maintainer)
- [Geoffrey TIEN](https://github.com/GeoffreyTien) (maintainer)
