const AUTH_CLAIM_SCHEMA = "cca3371a6cb1b715004407e325bd993c";
const API_VERSION = 'v1';
const CHANNEL_NAME = 'technology.polygon.polygonid_flutter_sdk';
const DEFAULT_AUTH_CLAIM_NONCE = '15930428023331155902';

/// Database
const databaseName = "polygonIdSdk.db";
//const sembastCodecName = "sembastCodec";

/// Key value Database
const keyValueStoreName = "keyValueStore";

/// Identity Database
const identityStoreName = "identityStore";
const identityDatabaseName = "polygonIdSdkIdentity";
const identityDatabasePrefix = "polygonIdSdkIdentity-";

/// Identity state
const identityStateStoreName = "identityStateStore";

/// Identity state trees
const claimsTreeStoreName = "claimsTreeStore";
const revocationTreeStoreName = "revocationTreeStore";
const rootsTreeStoreName = "rootsTreeStore";

/// Credential
const claimStoreName = "claimStore";

/// Iden3comm
const interactionStoreName = "interactionStore";

/// DID profile info
const didProfileInfoStoreName = "didProfileInfoStore";

/// profiles store
const profilesStoreName = "profilesStore";

/// State
const stateAbiJson = '''
{
  "_format": "hh-sol-artifact-1",
  "contractName": "StateV2",
  "sourceName": "contracts/state/StateV2.sol",
  "abi": [
    {
      "anonymous": false,
      "inputs": [
        {
          "indexed": false,
          "internalType": "uint8",
          "name": "version",
          "type": "uint8"
        }
      ],
      "name": "Initialized",
      "type": "event"
    },
    {
      "anonymous": false,
      "inputs": [
        {
          "indexed": true,
          "internalType": "address",
          "name": "previousOwner",
          "type": "address"
        },
        {
          "indexed": true,
          "internalType": "address",
          "name": "newOwner",
          "type": "address"
        }
      ],
      "name": "OwnershipTransferStarted",
      "type": "event"
    },
    {
      "anonymous": false,
      "inputs": [
        {
          "indexed": true,
          "internalType": "address",
          "name": "previousOwner",
          "type": "address"
        },
        {
          "indexed": true,
          "internalType": "address",
          "name": "newOwner",
          "type": "address"
        }
      ],
      "name": "OwnershipTransferred",
      "type": "event"
    },
    {
      "anonymous": false,
      "inputs": [
        {
          "indexed": false,
          "internalType": "uint256",
          "name": "id",
          "type": "uint256"
        },
        {
          "indexed": false,
          "internalType": "uint256",
          "name": "blockN",
          "type": "uint256"
        },
        {
          "indexed": false,
          "internalType": "uint256",
          "name": "timestamp",
          "type": "uint256"
        },
        {
          "indexed": false,
          "internalType": "uint256",
          "name": "state",
          "type": "uint256"
        }
      ],
      "name": "StateUpdated",
      "type": "event"
    },
    {
      "inputs": [],
      "name": "VERSION",
      "outputs": [
        {
          "internalType": "string",
          "name": "",
          "type": "string"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "acceptOwnership",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "id",
          "type": "uint256"
        }
      ],
      "name": "getGISTProof",
      "outputs": [
        {
          "components": [
            {
              "internalType": "uint256",
              "name": "root",
              "type": "uint256"
            },
            {
              "internalType": "bool",
              "name": "existence",
              "type": "bool"
            },
            {
              "internalType": "uint256[64]",
              "name": "siblings",
              "type": "uint256[64]"
            },
            {
              "internalType": "uint256",
              "name": "index",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "value",
              "type": "uint256"
            },
            {
              "internalType": "bool",
              "name": "auxExistence",
              "type": "bool"
            },
            {
              "internalType": "uint256",
              "name": "auxIndex",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "auxValue",
              "type": "uint256"
            }
          ],
          "internalType": "structIState.GistProof",
          "name": "",
          "type": "tuple"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "id",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "blockNumber",
          "type": "uint256"
        }
      ],
      "name": "getGISTProofByBlock",
      "outputs": [
        {
          "components": [
            {
              "internalType": "uint256",
              "name": "root",
              "type": "uint256"
            },
            {
              "internalType": "bool",
              "name": "existence",
              "type": "bool"
            },
            {
              "internalType": "uint256[64]",
              "name": "siblings",
              "type": "uint256[64]"
            },
            {
              "internalType": "uint256",
              "name": "index",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "value",
              "type": "uint256"
            },
            {
              "internalType": "bool",
              "name": "auxExistence",
              "type": "bool"
            },
            {
              "internalType": "uint256",
              "name": "auxIndex",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "auxValue",
              "type": "uint256"
            }
          ],
          "internalType": "structIState.GistProof",
          "name": "",
          "type": "tuple"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "id",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "root",
          "type": "uint256"
        }
      ],
      "name": "getGISTProofByRoot",
      "outputs": [
        {
          "components": [
            {
              "internalType": "uint256",
              "name": "root",
              "type": "uint256"
            },
            {
              "internalType": "bool",
              "name": "existence",
              "type": "bool"
            },
            {
              "internalType": "uint256[64]",
              "name": "siblings",
              "type": "uint256[64]"
            },
            {
              "internalType": "uint256",
              "name": "index",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "value",
              "type": "uint256"
            },
            {
              "internalType": "bool",
              "name": "auxExistence",
              "type": "bool"
            },
            {
              "internalType": "uint256",
              "name": "auxIndex",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "auxValue",
              "type": "uint256"
            }
          ],
          "internalType": "structIState.GistProof",
          "name": "",
          "type": "tuple"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "id",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "timestamp",
          "type": "uint256"
        }
      ],
      "name": "getGISTProofByTime",
      "outputs": [
        {
          "components": [
            {
              "internalType": "uint256",
              "name": "root",
              "type": "uint256"
            },
            {
              "internalType": "bool",
              "name": "existence",
              "type": "bool"
            },
            {
              "internalType": "uint256[64]",
              "name": "siblings",
              "type": "uint256[64]"
            },
            {
              "internalType": "uint256",
              "name": "index",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "value",
              "type": "uint256"
            },
            {
              "internalType": "bool",
              "name": "auxExistence",
              "type": "bool"
            },
            {
              "internalType": "uint256",
              "name": "auxIndex",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "auxValue",
              "type": "uint256"
            }
          ],
          "internalType": "structIState.GistProof",
          "name": "",
          "type": "tuple"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "getGISTRoot",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "start",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "length",
          "type": "uint256"
        }
      ],
      "name": "getGISTRootHistory",
      "outputs": [
        {
          "components": [
            {
              "internalType": "uint256",
              "name": "root",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "replacedByRoot",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "createdAtTimestamp",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "replacedAtTimestamp",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "createdAtBlock",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "replacedAtBlock",
              "type": "uint256"
            }
          ],
          "internalType": "structIState.GistRootInfo[]",
          "name": "",
          "type": "tuple[]"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "getGISTRootHistoryLength",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "root",
          "type": "uint256"
        }
      ],
      "name": "getGISTRootInfo",
      "outputs": [
        {
          "components": [
            {
              "internalType": "uint256",
              "name": "root",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "replacedByRoot",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "createdAtTimestamp",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "replacedAtTimestamp",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "createdAtBlock",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "replacedAtBlock",
              "type": "uint256"
            }
          ],
          "internalType": "structIState.GistRootInfo",
          "name": "",
          "type": "tuple"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "blockNumber",
          "type": "uint256"
        }
      ],
      "name": "getGISTRootInfoByBlock",
      "outputs": [
        {
          "components": [
            {
              "internalType": "uint256",
              "name": "root",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "replacedByRoot",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "createdAtTimestamp",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "replacedAtTimestamp",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "createdAtBlock",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "replacedAtBlock",
              "type": "uint256"
            }
          ],
          "internalType": "structIState.GistRootInfo",
          "name": "",
          "type": "tuple"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "timestamp",
          "type": "uint256"
        }
      ],
      "name": "getGISTRootInfoByTime",
      "outputs": [
        {
          "components": [
            {
              "internalType": "uint256",
              "name": "root",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "replacedByRoot",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "createdAtTimestamp",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "replacedAtTimestamp",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "createdAtBlock",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "replacedAtBlock",
              "type": "uint256"
            }
          ],
          "internalType": "structIState.GistRootInfo",
          "name": "",
          "type": "tuple"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "id",
          "type": "uint256"
        }
      ],
      "name": "getStateInfoById",
      "outputs": [
        {
          "components": [
            {
              "internalType": "uint256",
              "name": "id",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "state",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "replacedByState",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "createdAtTimestamp",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "replacedAtTimestamp",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "createdAtBlock",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "replacedAtBlock",
              "type": "uint256"
            }
          ],
          "internalType": "structIState.StateInfo",
          "name": "",
          "type": "tuple"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "id",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "state",
          "type": "uint256"
        }
      ],
      "name": "getStateInfoByIdAndState",
      "outputs": [
        {
          "components": [
            {
              "internalType": "uint256",
              "name": "id",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "state",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "replacedByState",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "createdAtTimestamp",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "replacedAtTimestamp",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "createdAtBlock",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "replacedAtBlock",
              "type": "uint256"
            }
          ],
          "internalType": "structIState.StateInfo",
          "name": "",
          "type": "tuple"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "id",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "startIndex",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "length",
          "type": "uint256"
        }
      ],
      "name": "getStateInfoHistoryById",
      "outputs": [
        {
          "components": [
            {
              "internalType": "uint256",
              "name": "id",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "state",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "replacedByState",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "createdAtTimestamp",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "replacedAtTimestamp",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "createdAtBlock",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "replacedAtBlock",
              "type": "uint256"
            }
          ],
          "internalType": "structIState.StateInfo[]",
          "name": "",
          "type": "tuple[]"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "id",
          "type": "uint256"
        }
      ],
      "name": "getStateInfoHistoryLengthById",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "getVerifier",
      "outputs": [
        {
          "internalType": "address",
          "name": "",
          "type": "address"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "id",
          "type": "uint256"
        }
      ],
      "name": "idExists",
      "outputs": [
        {
          "internalType": "bool",
          "name": "",
          "type": "bool"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "contractIStateTransitionVerifier",
          "name": "verifierContractAddr",
          "type": "address"
        }
      ],
      "name": "initialize",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "owner",
      "outputs": [
        {
          "internalType": "address",
          "name": "",
          "type": "address"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "pendingOwner",
      "outputs": [
        {
          "internalType": "address",
          "name": "",
          "type": "address"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "renounceOwnership",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "newVerifierAddr",
          "type": "address"
        }
      ],
      "name": "setVerifier",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "id",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "state",
          "type": "uint256"
        }
      ],
      "name": "stateExists",
      "outputs": [
        {
          "internalType": "bool",
          "name": "",
          "type": "bool"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "newOwner",
          "type": "address"
        }
      ],
      "name": "transferOwnership",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "id",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "oldState",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "newState",
          "type": "uint256"
        },
        {
          "internalType": "bool",
          "name": "isOldStateGenesis",
          "type": "bool"
        },
        {
          "internalType": "uint256[2]",
          "name": "a",
          "type": "uint256[2]"
        },
        {
          "internalType": "uint256[2][2]",
          "name": "b",
          "type": "uint256[2][2]"
        },
        {
          "internalType": "uint256[2]",
          "name": "c",
          "type": "uint256[2]"
        }
      ],
      "name": "transitState",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    }
  ]
}
''';

const interfaceCheckInterface = "0x01ffc9a7";

const nonMerklizedIssuerInterface = "0x58874949";

const onchainNonMerkelizedIssuerBaseAbiJson = '''
{
  "_format": "hh-sol-artifact-1",
  "contractName": "StateV2",
  "sourceName": "contracts/state/StateV2.sol",
  "abi": [
    {
      "inputs": [],
      "name": "CREDENTIAL_ADAPTER_VERSION",
      "outputs": [
        {
          "internalType": "string",
          "name": "",
          "type": "string"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "claimIndexHash",
          "type": "uint256"
        }
      ],
      "name": "getClaimProof",
      "outputs": [
        {
          "components": [
            {
              "internalType": "uint256",
              "name": "root",
              "type": "uint256"
            },
            {
              "internalType": "bool",
              "name": "existence",
              "type": "bool"
            },
            {
              "internalType": "uint256[]",
              "name": "siblings",
              "type": "uint256[]"
            },
            {
              "internalType": "uint256",
              "name": "index",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "value",
              "type": "uint256"
            },
            {
              "internalType": "bool",
              "name": "auxExistence",
              "type": "bool"
            },
            {
              "internalType": "uint256",
              "name": "auxIndex",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "auxValue",
              "type": "uint256"
            }
          ],
          "internalType": "struct SmtLib.Proof",
          "name": "",
          "type": "tuple"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "claimIndexHash",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "root",
          "type": "uint256"
        }
      ],
      "name": "getClaimProofByRoot",
      "outputs": [
        {
          "components": [
            {
              "internalType": "uint256",
              "name": "root",
              "type": "uint256"
            },
            {
              "internalType": "bool",
              "name": "existence",
              "type": "bool"
            },
            {
              "internalType": "uint256[]",
              "name": "siblings",
              "type": "uint256[]"
            },
            {
              "internalType": "uint256",
              "name": "index",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "value",
              "type": "uint256"
            },
            {
              "internalType": "bool",
              "name": "auxExistence",
              "type": "bool"
            },
            {
              "internalType": "uint256",
              "name": "auxIndex",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "auxValue",
              "type": "uint256"
            }
          ],
          "internalType": "struct SmtLib.Proof",
          "name": "",
          "type": "tuple"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "claimIndexHash",
          "type": "uint256"
        }
      ],
      "name": "getClaimProofWithStateInfo",
      "outputs": [
        {
          "components": [
            {
              "internalType": "uint256",
              "name": "root",
              "type": "uint256"
            },
            {
              "internalType": "bool",
              "name": "existence",
              "type": "bool"
            },
            {
              "internalType": "uint256[]",
              "name": "siblings",
              "type": "uint256[]"
            },
            {
              "internalType": "uint256",
              "name": "index",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "value",
              "type": "uint256"
            },
            {
              "internalType": "bool",
              "name": "auxExistence",
              "type": "bool"
            },
            {
              "internalType": "uint256",
              "name": "auxIndex",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "auxValue",
              "type": "uint256"
            }
          ],
          "internalType": "struct SmtLib.Proof",
          "name": "",
          "type": "tuple"
        },
        {
          "components": [
            {
              "internalType": "uint256",
              "name": "state",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "claimsRoot",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "revocationsRoot",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "rootsRoot",
              "type": "uint256"
            }
          ],
          "internalType": "struct IdentityLib.StateInfo",
          "name": "",
          "type": "tuple"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "getClaimsTreeRoot",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "_userId",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "_credentialId",
          "type": "uint256"
        }
      ],
      "name": "getCredential",
      "outputs": [
        {
          "components": [
            {
              "internalType": "uint256",
              "name": "id",
              "type": "uint256"
            },
            {
              "internalType": "string[]",
              "name": "context",
              "type": "string[]"
            },
            {
              "internalType": "string",
              "name": "_type",
              "type": "string"
            },
            {
              "internalType": "uint64",
              "name": "issuanceDate",
              "type": "uint64"
            },
            {
              "components": [
                {
                  "internalType": "string",
                  "name": "id",
                  "type": "string"
                },
                {
                  "internalType": "string",
                  "name": "_type",
                  "type": "string"
                }
              ],
              "internalType": "struct INonMerklizedIssuer.CredentialSchema",
              "name": "credentialSchema",
              "type": "tuple"
            },
            {
              "components": [
                {
                  "internalType": "string",
                  "name": "id",
                  "type": "string"
                },
                {
                  "internalType": "string",
                  "name": "_type",
                  "type": "string"
                }
              ],
              "internalType": "struct INonMerklizedIssuer.DisplayMethod",
              "name": "displayMethod",
              "type": "tuple"
            }
          ],
          "internalType": "struct INonMerklizedIssuer.CredentialData",
          "name": "",
          "type": "tuple"
        },
        {
          "internalType": "uint256[8]",
          "name": "",
          "type": "uint256[8]"
        },
        {
          "components": [
            {
              "internalType": "string",
              "name": "key",
              "type": "string"
            },
            {
              "internalType": "uint256",
              "name": "value",
              "type": "uint256"
            },
            {
              "internalType": "bytes",
              "name": "rawValue",
              "type": "bytes"
            }
          ],
          "internalType": "struct INonMerklizedIssuer.SubjectField[]",
          "name": "",
          "type": "tuple[]"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "getCredentialAdapterVersion",
      "outputs": [
        {
          "internalType": "string",
          "name": "",
          "type": "string"
        }
      ],
      "stateMutability": "pure",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "getId",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "getIsOldStateGenesis",
      "outputs": [
        {
          "internalType": "bool",
          "name": "",
          "type": "bool"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "getLatestPublishedClaimsRoot",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "getLatestPublishedRevocationsRoot",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "getLatestPublishedRootsRoot",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "getLatestPublishedState",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint64",
          "name": "revocationNonce",
          "type": "uint64"
        }
      ],
      "name": "getRevocationProof",
      "outputs": [
        {
          "components": [
            {
              "internalType": "uint256",
              "name": "root",
              "type": "uint256"
            },
            {
              "internalType": "bool",
              "name": "existence",
              "type": "bool"
            },
            {
              "internalType": "uint256[]",
              "name": "siblings",
              "type": "uint256[]"
            },
            {
              "internalType": "uint256",
              "name": "index",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "value",
              "type": "uint256"
            },
            {
              "internalType": "bool",
              "name": "auxExistence",
              "type": "bool"
            },
            {
              "internalType": "uint256",
              "name": "auxIndex",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "auxValue",
              "type": "uint256"
            }
          ],
          "internalType": "struct SmtLib.Proof",
          "name": "",
          "type": "tuple"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint64",
          "name": "revocationNonce",
          "type": "uint64"
        },
        {
          "internalType": "uint256",
          "name": "root",
          "type": "uint256"
        }
      ],
      "name": "getRevocationProofByRoot",
      "outputs": [
        {
          "components": [
            {
              "internalType": "uint256",
              "name": "root",
              "type": "uint256"
            },
            {
              "internalType": "bool",
              "name": "existence",
              "type": "bool"
            },
            {
              "internalType": "uint256[]",
              "name": "siblings",
              "type": "uint256[]"
            },
            {
              "internalType": "uint256",
              "name": "index",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "value",
              "type": "uint256"
            },
            {
              "internalType": "bool",
              "name": "auxExistence",
              "type": "bool"
            },
            {
              "internalType": "uint256",
              "name": "auxIndex",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "auxValue",
              "type": "uint256"
            }
          ],
          "internalType": "struct SmtLib.Proof",
          "name": "",
          "type": "tuple"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint64",
          "name": "revocationNonce",
          "type": "uint64"
        }
      ],
      "name": "getRevocationProofWithStateInfo",
      "outputs": [
        {
          "components": [
            {
              "internalType": "uint256",
              "name": "root",
              "type": "uint256"
            },
            {
              "internalType": "bool",
              "name": "existence",
              "type": "bool"
            },
            {
              "internalType": "uint256[]",
              "name": "siblings",
              "type": "uint256[]"
            },
            {
              "internalType": "uint256",
              "name": "index",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "value",
              "type": "uint256"
            },
            {
              "internalType": "bool",
              "name": "auxExistence",
              "type": "bool"
            },
            {
              "internalType": "uint256",
              "name": "auxIndex",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "auxValue",
              "type": "uint256"
            }
          ],
          "internalType": "struct SmtLib.Proof",
          "name": "",
          "type": "tuple"
        },
        {
          "components": [
            {
              "internalType": "uint256",
              "name": "state",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "claimsRoot",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "revocationsRoot",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "rootsRoot",
              "type": "uint256"
            }
          ],
          "internalType": "struct IdentityLib.StateInfo",
          "name": "",
          "type": "tuple"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "id",
          "type": "uint256"
        },
        {
          "internalType": "uint64",
          "name": "nonce",
          "type": "uint64"
        }
      ],
      "name": "getRevocationStatus",
      "outputs": [
        {
          "components": [
            {
              "components": [
                {
                  "internalType": "uint256",
                  "name": "state",
                  "type": "uint256"
                },
                {
                  "internalType": "uint256",
                  "name": "claimsTreeRoot",
                  "type": "uint256"
                },
                {
                  "internalType": "uint256",
                  "name": "revocationTreeRoot",
                  "type": "uint256"
                },
                {
                  "internalType": "uint256",
                  "name": "rootOfRoots",
                  "type": "uint256"
                }
              ],
              "internalType": "struct IOnchainCredentialStatusResolver.IdentityStateRoots",
              "name": "issuer",
              "type": "tuple"
            },
            {
              "components": [
                {
                  "internalType": "uint256",
                  "name": "root",
                  "type": "uint256"
                },
                {
                  "internalType": "bool",
                  "name": "existence",
                  "type": "bool"
                },
                {
                  "internalType": "uint256[]",
                  "name": "siblings",
                  "type": "uint256[]"
                },
                {
                  "internalType": "uint256",
                  "name": "index",
                  "type": "uint256"
                },
                {
                  "internalType": "uint256",
                  "name": "value",
                  "type": "uint256"
                },
                {
                  "internalType": "bool",
                  "name": "auxExistence",
                  "type": "bool"
                },
                {
                  "internalType": "uint256",
                  "name": "auxIndex",
                  "type": "uint256"
                },
                {
                  "internalType": "uint256",
                  "name": "auxValue",
                  "type": "uint256"
                }
              ],
              "internalType": "struct IOnchainCredentialStatusResolver.Proof",
              "name": "mtp",
              "type": "tuple"
            }
          ],
          "internalType": "struct IOnchainCredentialStatusResolver.CredentialStatus",
          "name": "",
          "type": "tuple"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "id",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "state",
          "type": "uint256"
        },
        {
          "internalType": "uint64",
          "name": "nonce",
          "type": "uint64"
        }
      ],
      "name": "getRevocationStatusByIdAndState",
      "outputs": [
        {
          "components": [
            {
              "components": [
                {
                  "internalType": "uint256",
                  "name": "state",
                  "type": "uint256"
                },
                {
                  "internalType": "uint256",
                  "name": "claimsTreeRoot",
                  "type": "uint256"
                },
                {
                  "internalType": "uint256",
                  "name": "revocationTreeRoot",
                  "type": "uint256"
                },
                {
                  "internalType": "uint256",
                  "name": "rootOfRoots",
                  "type": "uint256"
                }
              ],
              "internalType": "struct IOnchainCredentialStatusResolver.IdentityStateRoots",
              "name": "issuer",
              "type": "tuple"
            },
            {
              "components": [
                {
                  "internalType": "uint256",
                  "name": "root",
                  "type": "uint256"
                },
                {
                  "internalType": "bool",
                  "name": "existence",
                  "type": "bool"
                },
                {
                  "internalType": "uint256[]",
                  "name": "siblings",
                  "type": "uint256[]"
                },
                {
                  "internalType": "uint256",
                  "name": "index",
                  "type": "uint256"
                },
                {
                  "internalType": "uint256",
                  "name": "value",
                  "type": "uint256"
                },
                {
                  "internalType": "bool",
                  "name": "auxExistence",
                  "type": "bool"
                },
                {
                  "internalType": "uint256",
                  "name": "auxIndex",
                  "type": "uint256"
                },
                {
                  "internalType": "uint256",
                  "name": "auxValue",
                  "type": "uint256"
                }
              ],
              "internalType": "struct IOnchainCredentialStatusResolver.Proof",
              "name": "mtp",
              "type": "tuple"
            }
          ],
          "internalType": "struct IOnchainCredentialStatusResolver.CredentialStatus",
          "name": "",
          "type": "tuple"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "getRevocationsTreeRoot",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "rootsTreeRoot",
          "type": "uint256"
        }
      ],
      "name": "getRootProof",
      "outputs": [
        {
          "components": [
            {
              "internalType": "uint256",
              "name": "root",
              "type": "uint256"
            },
            {
              "internalType": "bool",
              "name": "existence",
              "type": "bool"
            },
            {
              "internalType": "uint256[]",
              "name": "siblings",
              "type": "uint256[]"
            },
            {
              "internalType": "uint256",
              "name": "index",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "value",
              "type": "uint256"
            },
            {
              "internalType": "bool",
              "name": "auxExistence",
              "type": "bool"
            },
            {
              "internalType": "uint256",
              "name": "auxIndex",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "auxValue",
              "type": "uint256"
            }
          ],
          "internalType": "struct SmtLib.Proof",
          "name": "",
          "type": "tuple"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "claimsTreeRoot",
          "type": "uint256"
        },
        {
          "internalType": "uint256",
          "name": "root",
          "type": "uint256"
        }
      ],
      "name": "getRootProofByRoot",
      "outputs": [
        {
          "components": [
            {
              "internalType": "uint256",
              "name": "root",
              "type": "uint256"
            },
            {
              "internalType": "bool",
              "name": "existence",
              "type": "bool"
            },
            {
              "internalType": "uint256[]",
              "name": "siblings",
              "type": "uint256[]"
            },
            {
              "internalType": "uint256",
              "name": "index",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "value",
              "type": "uint256"
            },
            {
              "internalType": "bool",
              "name": "auxExistence",
              "type": "bool"
            },
            {
              "internalType": "uint256",
              "name": "auxIndex",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "auxValue",
              "type": "uint256"
            }
          ],
          "internalType": "struct SmtLib.Proof",
          "name": "",
          "type": "tuple"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "rootsTreeRoot",
          "type": "uint256"
        }
      ],
      "name": "getRootProofWithStateInfo",
      "outputs": [
        {
          "components": [
            {
              "internalType": "uint256",
              "name": "root",
              "type": "uint256"
            },
            {
              "internalType": "bool",
              "name": "existence",
              "type": "bool"
            },
            {
              "internalType": "uint256[]",
              "name": "siblings",
              "type": "uint256[]"
            },
            {
              "internalType": "uint256",
              "name": "index",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "value",
              "type": "uint256"
            },
            {
              "internalType": "bool",
              "name": "auxExistence",
              "type": "bool"
            },
            {
              "internalType": "uint256",
              "name": "auxIndex",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "auxValue",
              "type": "uint256"
            }
          ],
          "internalType": "struct SmtLib.Proof",
          "name": "",
          "type": "tuple"
        },
        {
          "components": [
            {
              "internalType": "uint256",
              "name": "state",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "claimsRoot",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "revocationsRoot",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "rootsRoot",
              "type": "uint256"
            }
          ],
          "internalType": "struct IdentityLib.StateInfo",
          "name": "",
          "type": "tuple"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "state",
          "type": "uint256"
        }
      ],
      "name": "getRootsByState",
      "outputs": [
        {
          "components": [
            {
              "internalType": "uint256",
              "name": "claimsRoot",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "revocationsRoot",
              "type": "uint256"
            },
            {
              "internalType": "uint256",
              "name": "rootsRoot",
              "type": "uint256"
            }
          ],
          "internalType": "struct IdentityLib.Roots",
          "name": "",
          "type": "tuple"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "getRootsTreeRoot",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "getSmtDepth",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "pure",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "_userId",
          "type": "uint256"
        }
      ],
      "name": "getUserCredentialIds",
      "outputs": [
        {
          "internalType": "uint256[]",
          "name": "",
          "type": "uint256[]"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "_stateContractAddr",
          "type": "address"
        }
      ],
      "name": "initialize",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "bytes4",
          "name": "interfaceId",
          "type": "bytes4"
        }
      ],
      "name": "supportsInterface",
      "outputs": [
        {
          "internalType": "bool",
          "name": "",
          "type": "bool"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    }
  ]
}
''';

const getIssuerIdInterface = "0x5d1ca631";

const getIssuerIdAbiJson = '''
{
  "_format": "hh-sol-artifact-1",
  "contractName": "Identity",
  "sourceName": "contracts/Identity.sol",
  "abi": [
    {
      "inputs": [],
      "name": "getId",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    }
  ]
}
''';
