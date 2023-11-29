aptos_keccak
------

keccak hash function support on Aptos.

### Gas cost evaluation
below is test result. there are 2 conclusion hinted here:
* native hash function is nesessary. about ~270 times gas reduction.(39 vs 10488).
* as for Move implementation, most expensive operation is hash.

| Test Case | Function Executed | Gas Used |
| :---: | :---: | :---: |
| case 1 | 10 * new | 16 |
| case 2 | new + 10 * update + finalize | 2319 |
| case 3 | new + update + 10 * finalize | 1701 |
| case 4 | new + 10 * (update + finalize) | 10488 |
| case 5 |  10 * native hash function | 39 |

detail test case is list:

#### case 1 empty_keccak
test result is:
```
{
  "Result": {
    "transaction_hash": "0xd4c7c6abb42eb4a1279c19795b1d98a1639e64529e8fa8f91ca9b1f0a39143e8",
    "gas_used": 16,
    "gas_unit_price": 100,
    "sender": "91fa761d3739cff9e5160ebb87f821cbd2d151b7e6857595d8b2e2658c386f07",
    "success": true,
    "version": 8230023,
    "vm_status": "status EXECUTED of type Execution"
  }
}
```
####  case 2 update_keccak
test result is:
```
{
  "Result": {
    "transaction_hash": "0xbb27ce70b00bb53e1034feb4838fed554900858292dfe9c3a8a6712d5832c7cf",
    "gas_used": 2319,
    "gas_unit_price": 100,
    "sender": "3fe1f41fd7050096cc47ad2a4254326860f6a430e1fad5553f3594212b30b41d",
    "success": true,
    "version": 8252854,
    "vm_status": "status EXECUTED of type Execution"
  }
}
```
####  case 3 finalize_keccak
test result is:
```
{
  "Result": {
    "transaction_hash": "0xa8250ae8f1d65d5c6fae9c88fdb20736bfeca37b5659e197361031a6c9257219",
    "gas_used": 1701,
    "gas_unit_price": 100,
    "sender": "3fe1f41fd7050096cc47ad2a4254326860f6a430e1fad5553f3594212b30b41d",
    "success": true,
    "version": 8253860,
    "vm_status": "status EXECUTED of type Execution"
  }
}
```
#### case 4 update_finalize_keccak
test result is:
```
{
  "Result": {
    "transaction_hash": "0x29e4244897f226fc27c6d0d707577a455ab4cbeb514bcd7233124282da6b5226",
    "gas_used": 10488,
    "gas_unit_price": 100,
    "sender": "b1473753fa7d36c9aa4ab11a881f5db0055b105ebc433f8420a85188952750b0",
    "success": true,
    "version": 8562614,
    "vm_status": "status EXECUTED of type Execution"
  }
}
```

#### case 5 keccak256_native_test
test result is:
```
{
  "Result": {
    "transaction_hash": "0x687babf48df7f3b8e11fe1f88c0dc969d0d36e0cf0fd8524227b9baa8e5ca036",
    "gas_used": 39,
    "gas_unit_price": 100,
    "sender": "3fe1f41fd7050096cc47ad2a4254326860f6a430e1fad5553f3594212b30b41d",
    "success": true,
    "version": 8475678,
    "vm_status": "status EXECUTED of type Execution"
  }
}
```
