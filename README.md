# Batch Proxy Upgrade

[![Github Actions][gha-badge]][gha] 
[![Foundry][foundry-badge]][foundry] 
[![License: MIT][license-badge]][license]

[gha]: https://github.com/Kwenta/foundry-scaffold/actions
[gha-badge]: https://github.com/Kwenta/foundry-scaffold/actions/workflows/test.yml/badge.svg
[foundry]: https://getfoundry.sh/
[foundry-badge]: https://img.shields.io/badge/Built%20with-Foundry-FFDB1C.svg
[license]: https://opensource.org/licenses/MIT
[license-badge]: https://img.shields.io/badge/License-MIT-blue.svg

## Proof of concept upgrade pattern for upgrading multiple proxies at once

<p align="center">
  <img src="/proxy.png" width="1000" height="600" alt="ProxyDiagram"/>
</p>

## Contracts

```
script/TestnetDeploy.s.sol ^0.8.13
└── lib/forge-std/src/Script.sol >=0.6.0 <0.9.0
    ├── lib/forge-std/src/console.sol >=0.4.22 <0.9.0
    ├── lib/forge-std/src/console2.sol >=0.4.22 <0.9.0
    └── lib/forge-std/src/StdJson.sol >=0.6.0 <0.9.0
        └── lib/forge-std/src/Vm.sol >=0.6.0 <0.9.0
src/Factory.sol ^0.8.0
└── src/base/Account.sol ^0.8.0
    └── src/Factory.sol ^0.8.0 (*)
src/base/Account.sol ^0.8.0 (*)
src/base/Logic.sol ^0.8.0
src/base/LogicV2.sol ^0.8.0
test/UpgradeTest.t.sol ^0.8.13
├── lib/forge-std/src/Test.sol >=0.6.0 <0.9.0
│   ├── lib/forge-std/src/Script.sol >=0.6.0 <0.9.0 (*)
│   └── lib/forge-std/lib/ds-test/src/test.sol >=0.5.0
├── src/Factory.sol ^0.8.0 (*)
├── src/base/Account.sol ^0.8.0 (*)
├── src/base/Logic.sol ^0.8.0
└── src/base/LogicV2.sol ^0.8.0
```

## Code Coverage

```
+----------------------------+----------------+----------------+---------------+----------------+
| File                       | % Lines        | % Statements   | % Branches    | % Funcs        |
+===============================================================================================+
| script/TestnetDeploy.s.sol | 0.00% (0/3)    | 0.00% (0/4)    | 100.00% (0/0) | 0.00% (0/1)    |
|----------------------------+----------------+----------------+---------------+----------------|
| src/Factory.sol            | 100.00% (2/2)  | 100.00% (2/2)  | 100.00% (0/0) | 100.00% (2/2)  |
|----------------------------+----------------+----------------+---------------+----------------|
| src/base/Account.sol       | 100.00% (9/9)  | 83.33% (10/12) | 50.00% (2/4)  | 100.00% (6/6)  |
|----------------------------+----------------+----------------+---------------+----------------|
| src/base/Logic.sol         | 100.00% (2/2)  | 100.00% (2/2)  | 100.00% (0/0) | 100.00% (2/2)  |
|----------------------------+----------------+----------------+---------------+----------------|
| src/base/LogicV2.sol       | 33.33% (1/3)   | 33.33% (1/3)   | 100.00% (0/0) | 33.33% (1/3)   |
|----------------------------+----------------+----------------+---------------+----------------|
| Total                      | 73.68% (14/19) | 65.22% (15/23) | 50.00% (2/4)  | 78.57% (11/14) |
+----------------------------+----------------+----------------+---------------+----------------+
```

## Deployment Addresses

#### Optimism

#### Optimism Goerli
