# Deploy-7-node-on-Quorum-Blockchain-
Smart contract: Lottery Application
  - Smart contract allow the participant to participate in Lottery by sending 1 ether.
  - All ether balance is stored in a smart contract address.
  - To find the winner, the manager calls Select_Winner() function, now this function selects one winner and it transfers all ether from the smart contract to the winner account.
  - Here manager is the person who deployed the smart contract in blockchain, only the manager can call the Select_winner(),getBalanace()(To know the smart contract amount) function
  # Deploy this Smart Contract on the Blockchain
 1) First clone the git repo of the quorum example in your local machine using this command: git clone https://github.com/jpmorganchase/quorum-examples.git
 2) To run this example we need docker and docker-compose. (For installation follow this doc: https://docs.docker.com/engine/install/ubuntu/)
 3) Now move to the quorum-examples directory
 4) By default, Quorum Network is created using Istanbul BFT consensus, to change consensus protocol we use environment variable QUORUM_CONSENSUS=raft
 5) Now enter 'QUORUM_CONSENSUS=raft docker-compose up -d' command to start and load the examples in docker.
 6) To check whether all nodes' container is running or not we use 'docker ps' command and wait until all container status become healthy.
 7) For this example we are going to deploy our smart contract through node_1, for that first we have to enter into the javascript geth console.
 8) To enter in the javascript geth console for the first node we use the command: docker exec -it quorum-examples_node1_1 geth attach /qdata/dd/geth.ipc 
 9) Now we have to find bytecode and abi code for our smart contract, to generate these use command: solcjs --bin --abi <Your Contract Name>.sol
 10) Replace those bytecode and abi codes in 'private-contract.js', and also remove the value in the privateFor parameter. You can find this file in 'quorum-examples/examples/7nodes' directory. If we want to send any transaction to any particular node at that time use the privateFor parameter and set that using that node's public key which you can find from the '/quorum-examples/examples/7nodes/keys' directory.
 11) Now using loadScript('/examples/private-contract.js') you can deploy your smart contract on the quorum blockchain and see mined address and transaction hash if your contract is mined succesfully on a blockchain.
