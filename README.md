## ansible-octo-doodle
----------------------

#### TestinGround - Emulate and Observe!
----------------------------------------

- Tests that have to be done or theories that have to be validated before moving them to production
- Doubts that have to clarified, which would be part of the solution plan.
- Will this work if a parameter is added or removed???
- re-think an existing problem!
- Document important findings, which were thought to work otherwise [ design epiphany ]

#### GLOBAL INVENTORY & ROLES
-----------------------------

Inventory contain files for all the environments of same cluster, with their respected
-   clustername_hostInventory.yaml
    - Hosts
    - Groups
    - Variables

Roles contain the files for all the environments of same cluster.

#### nfsBundle
--------------

contains YAML playbooks which installs and configures  nfs: client/server on host machines.
