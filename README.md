rally
=======

#### Table of Contents

1. [Overview - What is the rally module?](#overview)
2. [Module Description - What does the module do?](#module-description)
3. [Setup - The basics of getting started with rally](#setup)
4. [Implementation - An under-the-hood peek at what the module is doing](#implementation)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)
7. [Contributors - Those with commits](#contributors)

Overview
--------

The rally module is a part of [OpenStack](https://github.com/openstack), an effort by the Openstack infrastructure team to provide continuous integration testing and code review for Openstack and Openstack community projects not part of the core software.  The module its self is used to flexibly configure and manage the FIXME service for Openstack.

Module Description
------------------

The rally module is a thorough attempt to make Puppet capable of managing the entirety of rally.  This includes manifests to provision region specific endpoint and database connections.  Types are shipped as part of the rally module to assist in manipulation of configuration files.

Setup
-----

**What the rally module affects**

* [Rally](https://wiki.openstack.org/wiki/Rally), the FIXME service for Openstack.

### Installing rally

    rally is not currently in Puppet Forge, but is anticipated to be added soon.  Once that happens, you'll be able to install rally with:
    puppet module install openstack/rally

### Beginning with rally

To utilize the rally module's functionality you will need to declare multiple resources.  The following is a modified excerpt from the [openstack module](https://github.com/stackfoge/puppet-openstack).  This is not an exhaustive list of all the components needed, we recommend you consult and understand the [openstack module](https://github.com/stackforge/puppet-openstack) and the [core openstack](http://docs.openstack.org) documentation.

Implementation
--------------

### rally

rally is a combination of Puppet manifest and ruby code to delivery configuration and extra functionality through types and providers.

Limitations
------------

* All the rally types use the CLI tools and so need to be ran on the rally node.

Beaker-Rspec
------------

This module has beaker-rspec tests

To run the tests on the default vagrant node:

```shell
bundle install
bundle exec rake acceptance
```

For more information on writing and running beaker-rspec tests visit the documentation:

* https://github.com/puppetlabs/beaker/wiki/How-to-Write-a-Beaker-Test-for-a-Module

Development
-----------

Developer documentation for the entire puppet-openstack project.

* https://wiki.openstack.org/wiki/Puppet-openstack#Developer_documentation

Contributors
------------

* https://github.com/openstack/puppet-rally/graphs/contributors
